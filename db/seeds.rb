require 'date'

User.destroy_all

User.create!(email: 'test1@test.com', password: 'password', password_confirmation: 'password', first_name: 'François', last_name: 'Parmentier', phone_number: '0000000000')
User.create!(email: 'test2@test.com', password: 'password', password_confirmation: 'password', first_name: 'Eric', last_name: 'Le Borgne', phone_number: '1111111111')
User.create!(email: 'test3@test.com', password: 'password', password_confirmation: 'password', first_name: 'Kevin', last_name: 'Tchiadeu', phone_number: '1111111111')
User.create!(email: 'test4@test.com', password: 'password', password_confirmation: 'password', first_name: 'Labelle', last_name: 'Merguez', phone_number: '1111111111')

Vehicle.destroy_all

Vehicle.create(user_id: User.first.id, name: 'Millenium Falcon', price: 10000, city: 'Kiev', category: 'SF', available: true, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbLFKaIBd1Hs6MZGm8_Y4YE7MyTOFrWlBZrQ&usqp=CAU')
Vehicle.create(user_id: User.first.id, name: 'DeLorean DMC-12', price: 1200, city: 'Rennes', category: 'SF', available: true, image: 'https://www.motortrend.com/uploads/2022/03/1982_DeLorean_DMC-12_Time_Machine_Mecum_11.jpg')
Vehicle.create(user_id: User.first.id, name: 'the Flying Dutchman', price: 1500, city: 'Saint-Domingue', category: 'Fantasy', available: true, image: 'https://i.pinimg.com/736x/23/4c/9f/234c9f872637c7d20d75a1294df2fa2c.jpg')
Vehicle.create(user_id: User.last.id, name: 'Batmobile', price: 1900, city: 'Gotham City', category: 'Superheroes', available: true, image: 'https://images.hdqwalls.com/wallpapers/batman-batmobile-img.jpg')
Vehicle.create(user_id: User.last.id, name: 'Toyota Fast & Furious', price: 150, city: 'Los Angeles', category: 'Classical', available: true, image: 'https://i.pinimg.com/originals/68/1b/54/681b5411369353221a1109fbaff9237b.jpg')
Vehicle.create(user_id: User.last.id, name: 'Taxi avec Sami en chauffeur', price: 350, city: 'Marseille', category: 'Classical', available: true, image: 'https://i.ytimg.com/vi/mL5DnlpNZC0/maxresdefault.jpg')
Vehicle.create(user_id: User.last.id, name: 'Le Bus Magique', price: 10, city: 'Moscou', category: 'Classical', available: true, image: 'https://static.hitek.fr/img/actualite/2017/02/09/fb_unnamed-18.webp')
Vehicle.create(user_id: User.last.id, name: 'Tapis volant Alladin', price: 800, city: 'Khartoum', category: 'Classical', available: true, image: 'https://disney-planet.fr/wp-content/uploads/2016/11/tapis-magique-personnage-aladdin-06.jpg')
Vehicle.create(user_id: User.last.id, name: 'Traineau de Papa Noël', price: 1, city: 'Upernavik', category: 'superheroes', available: true, image: 'http://www.etrepagny.fr/wp-content/uploads/2018/12/fabrication-traineau-pere-norel-etrepagny-2018-13.jpg')
Vehicle.create(user_id: User.last.id, name: 'Le Chat-Bus', price: 1200, city: 'Tokyo', category: 'fantasy', available: true, image: 'https://kultt.fr/wp-content/uploads/2018/06/chatbus-velo-Hiroshima-uai-640x360.jpg')

Booking.destroy_all

date1 = Date.new(2023, 2, 1)
date2 = Date.new(2023, 2, 5)

Booking.create(start: date1, end: date2, user_id: User.last.id, vehicle_id: Vehicle.first.id)
