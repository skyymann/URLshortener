# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ActiveRecord::Base.transaction do
  User.create(:email => "CJ@gmail.com")
  User.create(:email => "Flarnie@gmail.com")
  User.create(:email => "Jeff@gmail.com")
  User.create(:email => "GeorgesStPierre@gmail.com")
  User.create(:email => "Ned@gmail.com")
end
