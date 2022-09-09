class Transfer::CreateService
  attr_reader :amount, :account_number, :sender_account, :receiver_account, :transfer, :errors

  def initialize(amount:, account_number:, sender_account:)
    @amount = amount.to_i
    @account_number = account_number
    @sender_account = sender_account
    @receiver_account = Account.find_by(number: account_number)
    @errors = []
  end

  def call
    create_transfer! if valid?
    self
  end

  private

  def validate!
    return if sender_account.balance >= amount && receiver_account.present? && sender_account != receiver_account

    @errors << 'invalid transfer parameters'
  end

  def valid?
    validate!
    @errors.empty?
  end

  def create_transfer!
    @transfer = Transfer.new(
      amount: amount,
      cipher: account_number,
      sender: sender_account.user,
      receiver: receiver_account.user
    )

    @transfer.save! ? change_accounts_balance! : add_errors
  end

  def add_errors
    @errors << @transfer.errors
  end

  def change_accounts_balance!
    sender_account.decrease_balance(amount)
    receiver_account.increase_balance(amount)
  end
end
