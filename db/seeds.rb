# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# 0816 / seed
(1..5).each do |x|
    Major1.create(name: "전공#{x}")
    Category.create(name: "카테고리#{x}")
end
(1..5).each do |x|
    User.create(nickname: "user#{x}", email: "user#{x}@email.com", password: "123456", major1_id: "#{x}")
    User.create(nickname: "admin#{x}", email: "admin#{x}@email.com", password: "123456", major1_id: "#{x}", admin: true, confirmed_at: Time.now)
end

# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
