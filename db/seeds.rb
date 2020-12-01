# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'faker'

# Tag.create!(name: "Plumbing")
# Tag.create!(name: "Landscaping")
# Tag.create!(name: "Driving")
# Tag.create!(name: "Housekeeping")
# Tag.create!(name: "Cooking")


# puts "start seeding"
# 50.times do
#   user = User.create(first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     password: "password")
#   if rand(0..1) == 1
#     worker_profile = WorkerProfile.create!(user: user, bio: "some bio")
#     rand(1..3).times do
#       WorkerProfileTag.create!(rate: rand(10..50), worker_profile: worker_profile, tag: Tag.all.sample)
#     end
#   end
#   puts "seeding user"
# end

# puts "start seeding bookings"

# 50.times do
#   booking = Booking.create!(
#     user: User.all.sample,
#     worker_profile_tag: WorkerProfileTag.all.sample,
#     description: Faker::Lorem.sentence,
#     confirmation: [true, false].sample,
#     date: Date.today + rand(0..30),
#     duration: rand(1..5),
#     price: 100
#     )
#   review = Review.create!(
#     score: rand(1..5),
#     description: Faker::Lorem.sentence,
#     booking: booking,
#     user: booking.user,
#     )

#   puts "seeding bookings and reviews"
# end

def pick_rand_time
  from = rand(8..20)
  to = from + rand(2..3)
  return [from, to].map(&:to_s)
end


WorkerProfile.all.each do |w|
  rand(2..3).times do
    time = pick_rand_time
    Availability.create(
      day: rand(0..6),
      worker_profile: w,
      from: time[0],
      to: time[1]
      )
  end
end



# create_table "availabilities", force: :cascade do |t|
#   t.integer "day"
#   t.bigint "worker_profile_id", null: false
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
#   t.datetime "from"
#   t.datetime "to"
#   t.index ["worker_profile_id"], name: "index_availabilities_on_worker_profile_id"
# end



