
require 'faker'
require 'open-uri'
require 'csv'

puts 'Seed: Deleting existing records...'
# update when Friendship is done

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
# Picture for text user
filepaht = 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60'
file = URI.open(filepaht)
user1.profile_picture.attach(io: file, filename: "#{user1.username}.jgp", content_type: 'image/jpg')
user1.save!
puts 'Seed: Test user created...'


puts 'Seed: Seeding...'

# create users

CSV.foreach(Rails.root.join('db', 'users.csv'), headers: true, col_sep: ";") do |row|
  user = User.new
  user.username = row['username']
  user.first_name = row['first_name']
  user.last_name = row['last_name']
  user.age_range = row['age_range']
  user.city = row['city']
  user.email = row['email']
  user.password = row['password']
  user.profile_description = row['profile_description']
  user.carbon_count = row['carbon_count']

  # Upload and attach the user's profile picture using Cloudinary
  file = URI.open(row['picture_file_path'])
  user.profile_picture.attach(io: file, filename: File.basename(row['picture_file_path']), content_type: 'image/jpg')
  user.save!
end

# Create a new category

CSV.foreach(Rails.root.join('db', 'categories.csv'), headers: true, col_sep: ";") do |row|
  category = Category.new
  category.name = row['name']
  category.description = row['description']

  # Upload and attach the category's picture using Cloudinary
  category_file = URI.open(row['categories_picture_file_path'])
  category.picture.attach(io: category_file, filename: File.basename(row['categories_picture_file_path']), content_type: 'image/jpg')
  category.save!
end

# Create a new challenge
CSV.foreach(Rails.root.join('db', 'challenges.csv'), headers: true, col_sep: ";") do |row|
  challenge = Challenge.new
  challenge.name = row['name']
  challenge.description = row['description']
  challenge.saving_carbonamount = row['saving_carbonamount']
  category = Category.where(name: row["category"]).first
  # SELECT * FROM categories WHERE name = 'Transportation' LIMIT 1;
  challenge.category = category

  # Upload and attach the challenge's picture using Cloudinary
  challenge_file = URI.open(row['challenges_picture_file_path'])
  challenge.picture.attach(io: challenge_file, filename: File.basename(row['challenges_picture_file_path']), content_type: 'image/jpg')

  challenge.save!
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
