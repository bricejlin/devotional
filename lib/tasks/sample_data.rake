namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Brice Lin",
                         email: "bricejlin@gmail.com",
                         password: "foobar",
                         password_confirmation: "foobar",
                         admin: true)
    20.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

      users = User.all(limit: 6)
      5.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.requests.create!(content: content) }
    end
  end
end