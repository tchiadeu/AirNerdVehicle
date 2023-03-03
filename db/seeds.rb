require 'date'
require 'open-uri'

User.destroy_all

User.create!(email: 'test1@test.com', password: 'password', password_confirmation: 'password', first_name: 'François', last_name: 'Parmentier', phone_number: '0000000000')
User.create!(email: 'test2@test.com', password: 'password', password_confirmation: 'password', first_name: 'Eric', last_name: 'Le Borgne', phone_number: '1111111111')
User.create!(email: 'test3@test.com', password: 'password', password_confirmation: 'password', first_name: 'Kevin', last_name: 'Tchiadeu', phone_number: '1111111111')
User.create!(email: 'test4@test.com', password: 'password', password_confirmation: 'password', first_name: 'Labelle', last_name: 'Merguez', phone_number: '1111111111')

Vehicle.destroy_all
file1 = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbLFKaIBd1Hs6MZGm8_Y4YE7MyTOFrWlBZrQ&usqp=CAU')
file2 = URI.open('https://www.motortrend.com/uploads/2022/03/1982_DeLorean_DMC-12_Time_Machine_Mecum_11.jpg')
file3 = URI.open('https://i.pinimg.com/736x/23/4c/9f/234c9f872637c7d20d75a1294df2fa2c.jpg')
file4 = URI.open('https://images.hdqwalls.com/wallpapers/batman-batmobile-img.jpg')
file5 = URI.open('https://i.pinimg.com/originals/68/1b/54/681b5411369353221a1109fbaff9237b.jpg')
vehicle1 = Vehicle.create(user_id: User.first.id, name: 'Millenium Falcon', price: 1000, city: 'Kiev', category: 'SF')
vehicle2 = Vehicle.create(user_id: User.first.id, name: 'DeLorean DMC-12', price: 220, city: 'Rennes', category: 'SF')
vehicle3 = Vehicle.create(user_id: User.first.id, name: 'the Flying Dutchman', price: 700, city: 'Saint-Domingue', category: 'Fantasy')
vehicle4 = Vehicle.create(user_id: User.last.id, name: 'Batmobile', price: 190, city: 'Gotham City', category: 'Superheroes')
vehicle5 = Vehicle.create(user_id: User.last.id, name: 'Toyota Fast & Furious', price: 150, city: 'Los Angeles', category: 'Classical')
vehicle1.images.attach(io: file1, filename: '1', content_type: "image/png")
vehicle2.images.attach(io: file2, filename: '2', content_type: "image/png")
vehicle3.images.attach(io: file3, filename: '3', content_type: "image/png")
vehicle4.images.attach(io: file4, filename: '4', content_type: "image/png")
vehicle5.images.attach(io: file5, filename: '5', content_type: "image/png")
vehicle1.save
vehicle2.save
vehicle3.save
vehicle4.save
vehicle5.save

Booking.destroy_all

date1 = Date.new(2023, 2, 1)
date2 = Date.new(2023, 2, 5)

Booking.create(start: date1, end: date2, user_id: User.last.id, vehicle_id: Vehicle.first.id)
