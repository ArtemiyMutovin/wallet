# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all

User.create([{ first_name: 'David', last_name: 'Brown',
               email: 'david@mail', password: 123_456 },
             { first_name: 'Mikhail', last_name: 'Viktor',
               email: 'mikhail@mail', password: 123_456 }])

