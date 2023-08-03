# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

UserCategory.destroy_all
Category.destroy_all
UserState.destroy_all
State.destroy_all
UserBill.destroy_all
Bill.destroy_all

Rake::Task["csv_load:all"].invoke
Rake::Task["import:members"].invoke