# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unless(Website.find_by_title "okcupid")
  Website.create(title: "okcupid", login_url: "https://www.okcupid.com/login", main_url: "http://www.okcupid.com/home");
end