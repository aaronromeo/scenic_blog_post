# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TOTAL_USERS = 20

User.destroy_all
Organization.destroy_all

org_01 = Organization.find_or_create_by!(name: "Make Food not Bombs")
org_01.events.find_or_create_by!(name: "Baby Got Track 2019")
org_01.events.find_or_create_by!(name: "Par For the Main Course")

org_02 = Organization.find_or_create_by!(name: "Coaches for Canada")
org_02.events.find_or_create_by!(name: "Santa's toy drive")
org_02.events.find_or_create_by!(name: "The Wreck Beach Clothing Drive")
org_02.events.find_or_create_by!(name: "Everyday is Earth Day")

(TOTAL_USERS - User.count).times.each do
  user = User.create(username: Faker::Internet.unique.email)
  if user.id % 2 == 0
    user.memberships.create(organization: org_01)
  else
    user.memberships.create(organization: org_02)
  end
end

org_01_membership_length = org_01.reload.memberships.length
5.times.each do
  random_user = org_01.memberships.shuffle.first.user
  puts "User with multiple memberships #{random_user.id}"
  random_user.memberships.create(organization: org_02)
end

org_01_events = org_01.events.shuffle
org_01.memberships.each do |membership|
  membership.user.events << org_01_events.first
  org_01_events.shuffle!
end

org_02_events = org_02.events.shuffle
org_02.reload.memberships.each do |membership|
  membership.user.events << org_02_events.first
  if rand(20) < 5
    membership.user.events << org_02_events.second
    puts "User with multiple events #{membership.user.id}"
  end
  org_02_events.shuffle!
end
