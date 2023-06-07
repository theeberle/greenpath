# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require 'open-uri'

puts 'Seed: Deleting existing records...'
# update
Event.destroy_all
Habit.destroy_all
Challenge.destroy_all
Category.destroy_all
User.destroy_all

# test user
puts 'Seed: Creating test user...'

user1 = User.create!(
  username: "Claraboo",
  first_name: "Clara",
  last_name: "Kane",
	age_range: 18,
	city: "Berlin",
  email: "clara@email.com",
  password: '123456',
	profile_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  carbon_count: 0
)
# chceck if it work first with one photo and this is to be replicated for each user, category and challenge
filepaht = 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60'
file = URI.open(filepaht)
user1.profile_picture.attach(io: file, filename: "#{user1.username}.jgp", content_type: 'image/jpg')
user1.save!
puts 'Seed: Test user created...'

puts 'Seed: Seeding...'
# pictures arrays still upload photos to claudinary and link later without column follow active storage
# add link for claudinary as an array
# user_url =

# not needed as arrays as it will be attached to a specific category and challenge
## challenges_url =
## category=

user2 = User.create!(
	username: Faker::Name.name,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
	age_range: 18,
	city: "Berlin",
  email: Faker::Internet.email,
  password: '123456',
	profile_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  carbon_count: 0
)
user3 = User.create!(
	username: Faker::Name.name,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
	age_range: 18,
	city: "Berlin",
  email: Faker::Internet.email,
  password: '123456',
	profile_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  carbon_count: 0
)
user4 = User.create!(
	username: Faker::Name.name,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
	age_range: 18,
	city: "Berlin",
  email: Faker::Internet.email,
  password: '123456',
	profile_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  carbon_count: 0
)
user5 = User.create!(
	username: Faker::Name.name,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
	age_range: 18,
	city: "Berlin",
  email: Faker::Internet.email,
  password: '123456',
	profile_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  carbon_count: 0
)


# CATEGORY PHOTO NEEDED - do manually
category1 = Category.create!(
  name: "Transportation",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
)
category2 = Category.create!(
  name: "Energy Consumption",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
)
category3 = Category.create!(
  name: "Waste Managment",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
)
category4 = Category.create!(
  name: "Water Conservation",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
)
category5 = Category.create!(
  name: "Sustainable Fashion",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
)

category6 = Category.create!(
  name: "Home Energy Efficiency",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
)
category7 = Category.create!(
  name: "Green Gardening",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
)
category8 = Category.create!(
  name: "Sustainable Diet",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
)
category8 = Category.create!(
  name: "Conscious Consumerism",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
)
category9 = Category.create!(
  name: "Conscious Sth",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
)
category10 = Category.create!(
  name: "Community Engagement",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
)

# challenges PHOTO NEEDED - do manually; and manual creation later
my_categories = [category1, category2, category3, category4, category5, category6, category7, category8, category9, category10]

my_categories.each do |category|
  5.times do
    challenge = Challenge.create!(
      name: "Save the Earth #{rand(1..10000)}",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      saving_carbonamount: rand(5..1000),
      category: category
  )
  end
end

# habit as booking for a test user> CREATE MANUALY

day = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

habit1 = Habit.create!(
	user: user1, # User.all.sample,
  implementation_cycle: "daily", # ["daily", "weekly", "monthly", "one-off"].sample,
	challenge: Challenge.all.sample, #challenge1
	day_of_week: day.sample
)

habit2 = Habit.create!(
	user: user1, # User.all.sample,
  implementation_cycle: "weekly", # ["daily", "weekly", "monthly"].sample,
	challenge: Challenge.all.sample, #challenge1
	day_of_week: day.sample
)


# this is for the booked habit that a person can manipulate on their dashboard

event= Event.create!(
  habit: habit1,
  status: ["completed", "overdue", "pending"].sample,
  due_date: DateTime.strptime("08/06/2023 11:00", "%m/%d/%Y %H:%M"),
)
event2= Event.create!(
  habit: habit1,
  status: ["completed", "overdue", "pending"].sample,
  due_date: DateTime.strptime("08/06/2023 11:00", "%m/%d/%Y %H:%M"),
)


## skip for now

# friendship= Friendship.create!(
# user_id:
# User_id:
# Status: ["accepted", "rejected", "pending"].sample
# )


puts 'Seed: Finished seeding!'
