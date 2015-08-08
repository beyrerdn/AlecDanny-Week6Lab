# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do
  user = User.create(
            :email => Faker::Internet.email,
            :password => "password",
            :first_name => Faker::Name.first_name,
            :last_name => Faker::Name.last_name,
            :username => Faker::Internet.user_name,
            :bio=> Faker::Lorem.paragraph(2),
            :image => Faker::Avatar.image)
  10.times do
    user.posts << Post.create( :body => Faker::Company.catch_phrase )
  end
end
