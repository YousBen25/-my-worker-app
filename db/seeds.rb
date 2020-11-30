# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Tag.create!(name: "Plumbing")
Tag.create!(name: "Landscaping")
Tag.create!(name: "Driving")
Tag.create!(name: "Housekeeping")
Tag.create!(name: "Cooking")

50.times do
  user = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: password)
  if rand(0..1) == 1
    worker = Worker.new(user: user)
    rand(1..3).times do
      WorkerTag.create!(rate: rand(10..50), worker: worker, tag: Tag.all.sample)
    end
  end
end


50.times do
  booking = Booking.new(
    user: User.all.sample,
    worker_profile_tag: Worker_Profile_Tag.all.sample,
    description: Faker::Lorem.sentence,
    confirmation: [true, false].sample,
    date: Date.today + rand(0..30),
    duration: (1..5).sample
    )
  review = Review.new(
    score: (1..5).sample,
    description: Faker::Lorem.sentence,
    booking: booking,
    user: booking.user,
    )

  booking.save!
  review.save!
end




