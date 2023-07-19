# adding the gems connetion to the seed file

require 'faker'
require 'open-uri'
require 'csv'

# delete the DB everytime the seeds are run

puts 'Seed: Deleting existing records...'

Event.destroy_all
Habit.destroy_all
Challenge.destroy_all
Category.destroy_all
User.destroy_all

# creating test user to make sure the log in to the app is possible

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
# Adding picture for text user separatelly from the DB
filepaht = 'https://res.cloudinary.com/dd45bmmjg/image/upload/v1686248215/michael-dam-mEZ3PoFGs_k-unsplash_aoscdc.jpg'
file = URI.open(filepaht)
user1.profile_picture.attach(io: file, filename: "#{user1.username}.jgp", content_type: 'image/jpg')
user1.save!
puts 'Seed: Test user created...'

# start actuall seeding based on the DB

puts 'Seed: Seeding...'

# DB is created based on the CSV files; if to change the DB use the working excel
# file and load new data to seeds_data folder

# create users
# col_sep: ";" is used to separate the data in the CSV file

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

# Habits for test user

habit1_clara = Habit.create!(
  user: user1, # User.all.sample,
  implementation_cycle: "Daily",
  challenge: Challenge.all.sample, # challenge1
  day_of_week: "Monday"
)

habit2_clara = Habit.create!(
  user: user1, # User.all.sample,
  implementation_cycle: "Daily",
  challenge: Challenge.all.sample, # challenge1
  day_of_week: "Monday"
)

habit3_clara = Habit.create!(
  user: user1, # User.all.sample,
  implementation_cycle: "Daily",
  challenge: Challenge.all.sample, # challenge1
  day_of_week: "Monday"
)

habit4_clara = Habit.create!(
  user: user1, # User.all.sample,
  implementation_cycle: "Daily",
  challenge: Challenge.all.sample, # challenge1
  day_of_week: "Monday"
)

# Event for the test user: this is for the booked habit that a person can manipulate on their dashboard

event1_clara = Event.create!(
  habit: habit1_clara,
  status: "accomplished",
  due_date: "15/06/2023 11:00"
)

event2_clara = Event.create!(
  habit: habit2_clara,
  status: "accomplished",
  due_date: "15/06/2023 11:00"
)

event3_clara = Event.create!(
  habit: habit1_clara,
  status: "accomplished",
  due_date: "10/06/2023 11:00"
)

event4_clara = Event.create!(
  habit: habit2_clara,
  status: "accomplished",
  due_date: "09/06/2023 11:00"
)

event5_clara = Event.create!(
  habit: habit1_clara,
  status: "accomplished",
  due_date: "08/06/2023 11:00"
)

event6_clara = Event.create!(
  habit: habit2_clara,
  status: "accomplished",
  due_date: "08/06/2023 11:00"
)

event7_clara = Event.create!(
  habit: habit1_clara,
  status: "accomplished",
  due_date: "07/06/2023 11:00"
)

event8_clara = Event.create!(
  habit: habit2_clara,
  status: "accomplished",
  due_date: "06/06/2023 11:00"
)

event9_clara = Event.create!(
  habit: habit2_clara,
  status: "accomplished",
  due_date: "05/06/2023 11:00"
)

event10_clara = Event.create!(
  habit: habit3_clara,
  status: "accomplished",
  due_date: "11/06/2023 11:00"
)

event11_clara = Event.create!(
  habit: habit4_clara,
  status: "accomplished",
  due_date: "11/06/2023 11:00"
)

event12_clara = Event.create!(
  habit: habit3_clara,
  status: "accomplished",
  due_date: "10/06/2023 11:00"
)

event13_clara = Event.create!(
  habit: habit3_clara,
  status: "accomplished",
  due_date: "09/06/2023 11:00"
)

event14_clara = Event.create!(
  habit: habit3_clara,
  status: "accomplished",
  due_date: "08/06/2023 11:00"
)

event15_clara = Event.create!(
  habit: habit4_clara,
  status: "accomplished",
  due_date: "08/06/2023 11:00"
)

event16_clara = Event.create!(
  habit: habit3_clara,
  status: "accomplished",
  due_date: "07/06/2023 11:00"
)

event17_clara = Event.create!(
  habit: habit3_clara,
  status: "accomplished",
  due_date: "06/06/2023 11:00"
)

event18_clara = Event.create!(
  habit: habit3_clara,
  status: "accomplished",
  due_date: "05/06/2023 11:00"
)

event19_clara = Event.create!(
  habit: habit3_clara,
  status: "accomplished",
  due_date: "04/06/2023 11:00"
)

puts "created #{Habit.count}(habits), and #{Event.count}(events)"

puts 'Seed: Finished seeding!'
