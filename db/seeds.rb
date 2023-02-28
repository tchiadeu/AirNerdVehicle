require 'date'

User.destroy_all

User.create!(email: 'test1@test.com', password: 'password', password_confirmation: 'password', first_name: 'François', last_name: 'Parmentier', phone_number: '0000000000')
User.create!(email: 'test2@test.com', password: 'password', password_confirmation: 'password', first_name: 'Eric', last_name: 'Le Borgne', phone_number: '1111111111')
User.create!(email: 'test3@test.com', password: 'password', password_confirmation: 'password', first_name: 'Kevin', last_name: 'Tchiadeu', phone_number: '1111111111')
User.create!(email: 'test4@test.com', password: 'password', password_confirmation: 'password', first_name: 'Labelle', last_name: 'Merguez', phone_number: '1111111111')

Vehicle.destroy_all

Vehicle.create(user_id: User.first.id, name: 'Faucon Millenium', price: 1000, city: 'Kiev', category: 'SF', available: true, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbLFKaIBd1Hs6MZGm8_Y4YE7MyTOFrWlBZrQ&usqp=CAU')
Vehicle.create(user_id: User.first.id, name: 'Delorean', price: 220, city: 'Rennes', category: 'SF', available: true, image: 'https://www.motortrend.com/uploads/2022/03/1982_DeLorean_DMC-12_Time_Machine_Mecum_11.jpg')
Vehicle.create(user_id: User.first.id, name: 'Hollandais Volant', price: 700, city: 'Saint-Domingue', category: 'Fantasy', available: true, image: 'https://i.pinimg.com/736x/23/4c/9f/234c9f872637c7d20d75a1294df2fa2c.jpg')
Vehicle.create(user_id: User.last.id, name: 'Batmobile', price: 190, city: 'Gotham City', category: 'Superheroes', available: true, image: 'https://images.hdqwalls.com/wallpapers/batman-batmobile-img.jpg')
Vehicle.create(user_id: User.last.id, name: 'Toyota Fast & Furious', price: 150, city: 'Los Angeles', category: 'Classical', available: true, image: 'https://i.pinimg.com/originals/68/1b/54/681b5411369353221a1109fbaff9237b.jpg')

Booking.destroy_all

date1 = Date.new(2023, 2, 1)
date2 = Date.new(2023, 2, 5)

Booking.create(start: date1, end: date2, user_id: User.first.id, vehicle_id: Vehicle.first.id)
