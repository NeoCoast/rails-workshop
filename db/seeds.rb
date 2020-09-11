# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_array = (1..20).to_a.map do |i| 
    User.create! email: "user_#{i}@email.com", username: "User ##{i}"
end

user_array.each do |user|
    users_to_follow = (user_array - [user]).sample(3)
    user.followees.push(*users_to_follow)
end


