# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
# for Cloudinary photos later
## require 'open-uri'

puts 'Seed: Deleting existing records...'
# update

Category.destroy_all
Challenge.destroy_all
Habit.destroy_all
Event.destroy_all
User.destroy_all

# test user
puts 'Seed: Creating test user...'

user11 = User.create!(
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
puts 'Seed: Test user created...'


puts 'Seed: Seeding...'
# pictures arrays still upload photos to claudinary and link later without column follow active storage
# add link for claudinary as an array
# user_url =

# not needed as arrays as it will be attached to a specific category and challenge
## challenges_url =
## category=

# user PHOTO NEEDED ignore right now , random photo later with user.attach.photo later to read about it

5 times do
user = User.create!(
	username: Faker::Name.name,
  	first_name: Faker::Name.first_name,
  	last_name: Faker::Name.last_name,
	age_range: 18,
	city: "Berlin",
  	email: Faker:Internet.email,
  	password: '123456',
	profile_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  	carbon_count: 0
)
end

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
name: "Conscious Consumerism",
description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
)
category10 = Category.create!(
name: "Community Engagement",
description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
)

#challenges PHOTO NEEDED - do manually; and manual creation later

5 times do
challenge = Challenge.create!(
  name: "Save the planet",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  saved_carbonamount: rand(5..1000),
  category: category1
)
end

5 times do
challenge = Challenge.create!(
  name: "Save the planet",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  saved_carbonamount: rand(5..1000),
  category: category2
)
end

5 times do
challenge = Challenge.create!(
  name: "Save the planet",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  saved_carbonamount: rand(5..1000),
  category: category3
)
end

5 times do
challenge = Challenge.create!(
  name: "Save the planet",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  saved_carbonamount: rand(5..1000),
  category: category4
)
end

5 times do
challenge = Challenge.create!(
  name: "Save the planet",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  saved_carbonamount: rand(5..1000),
  category: category5
)
end

5 times do
challenge = Challenge.create!(
  name: "Save the planet",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  saved_carbonamount: rand(5..1000),
  category: category6
)
end

5 times do
challenge = Challenge.create!(
  name: "Save the planet",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  saved_carbonamount: rand(5..1000),
  category: category7
)
end

5 times do
challenge = Challenge.create!(
  name: "Save the planet",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  saved_carbonamount: rand(5..1000),
  category: category8
)
end

5 times do
challenge = Challenge.create!(
  name: "Save the planet",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  saved_carbonamount: rand(5..1000),
  category: category9
)
end

5 times do
challenge = Challenge.create!(
  name: "Save the planet",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  saved_carbonamount: rand(5..1000),
  category: category10
)
end

# habit as booking for a test user> CREATE MANUALY

day = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

habit1 = Habit.create!(
	user: user11, # User.all.sample,
  	implementation_cycle: "daily", # ["daily", "weekly", "monthly", "one-off"].sample,
	challenge: Challenge.all.sample, #challenge1
	day_of_the_week: day.sample
)

habit2 = Habit.create!(
	user: user11, # User.all.sample,
  	implementation_cycle: "weekly", # ["daily", "weekly", "monthly"].sample,
	challenge: Challenge.all.sample, #challenge1
	day_of_the_week: day.sample
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
