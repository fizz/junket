# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.create(email: 'fizz@fastmail.fm', name: 'Fizz Orange', password: 'test123')
u.admin!
h = Hotel.create(name: 'Omni Nashville Hotel', user: u)
r1 = RoomType.create(name: 'single', capacity: 1)
r2 = RoomType.create(name: 'double', capacity: 2)
r4 = RoomType.create(name: 'suite', capacity: 4)
rm1 = Room.create(room_type: r1, hotel: h, number: 100, price_in_cents: 9900)
rm2 = Room.create(room_type: r2, hotel: h, number: 101, price_in_cents: 11900)
rm4 = Room.create(room_type: r4, hotel: h, number: 102, price_in_cents: 12900)
