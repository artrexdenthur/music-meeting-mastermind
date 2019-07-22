# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bass_gian = Singer.find_or_create_by(name: "Gian Porro", age: 56, description: "constant")
bari_paul = Singer.find_or_create_by(name: "Paul Ashour", age: 28, description: "constant")
lead_mike = Singer.find_or_create_by(name: "Mike Wadsley", age: 48, description: "constant")
tenor_doug = Singer.find_or_create_by(name: "Doug Wehrwein", age: 15, description: "constant")
tb = Singer.find_or_create_by(name: "Keith Waldheim", age: 24, description: "constant")
bl = Singer.find_or_create_by(name: "Wes Short", age: 32, description: "constant")

admin = User.find_or_create_by(admin: true, email: "paul.ashour@gmail.com", profile: bari_paul) do |user|
  user.password = "asdfasdf"
  user.profile = bari_paul
end
sor_user = User.find_or_create_by(email: "sor@sor.sor") do |user|
  user.password = "asdfasdf"
  user.profile = bass_gian
end
reg_user = User.find_or_create_by(email: "test@test.test") do |user|
  user.password = "asdfasdf"
  user.profile = tb
end
vm = Chorus.find_or_create_by(name: "Vocal Majority", user_id: admin.id)
wc = Chorus.find_or_create_by(name: "Wesminster Chorus", user_id: admin.id)
sor = Chorus.find_or_create_by(name: "Sound of the Rockies",user_id: sor_user.id)

# Chorus.all.each { |c| c.save }
# Singer.all.each { |s| s.save }

sor.memberships.find_or_create_by(bass: true, singer_id: bass_gian.id)
sor.memberships.find_or_create_by(baritone: true, singer_id: bari_paul.id)
sor.memberships.find_or_create_by(lead: true, singer_id: lead_mike.id)
sor.memberships.find_or_create_by(tenor: true, singer_id: tenor_doug.id)
sor.memberships.find_or_create_by(tenor: true, singer_id: tb.id)
sor.memberships.find_or_create_by(lead: true, singer_id: bl.id)
puts vm.save
vm.memberships.find_or_create_by(bass: true, singer_id: tb.id)
wc.memberships.find_or_create_by(baritone: true, singer_id: bl.id)

# and additional faker data

[sor, vm, wc].each do |cho|
  10.times do
    s = Singer.create(
      name: Faker::Name.name,
      age: rand(16..100),
      description: Faker::TvShows::Buffy.quote
      )
    cho.memberships.create(bass: true, singer_id: s.id)
  end
  10.times do
    s = Singer.create(
      name: Faker::Name.name,
      age: rand(16..100),
      description: Faker::TvShows::Buffy.quote
      )
    cho.memberships.create(baritone: true, singer_id: s.id)
  end
  10.times do
    s = Singer.create(
      name: Faker::Name.name,
      age: rand(16..100),
      description: Faker::TvShows::Buffy.quote
      )
    cho.memberships.create(lead: true, singer_id: s.id)
  end
  10.times do
    s = Singer.create(
      name: Faker::Name.name,
      age: rand(16..100),
      description: Faker::TvShows::Buffy.quote
      )
    cho.memberships.create(tenor: true, singer_id: s.id)
  end

  Singer.all.each { |s| s.save }
end