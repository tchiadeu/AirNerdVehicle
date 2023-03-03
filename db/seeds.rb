require 'date'
require 'open-uri'

puts '####### Cleaning database #######'
Booking.destroy_all
Vehicle.destroy_all
User.destroy_all

puts '####### Creating Users #############'
User.create!(email: 'test1@test.com', password: 'password', password_confirmation: 'password', first_name: 'François', last_name: 'Parmentier', phone_number: '0000000000')
User.create!(email: 'test2@test.com', password: 'password', password_confirmation: 'password', first_name: 'Eric', last_name: 'Le Borgne', phone_number: '1111111111')
User.create!(email: 'test3@test.com', password: 'password', password_confirmation: 'password', first_name: 'Kevin', last_name: 'Tchiadeu', phone_number: '1111111111')
User.create!(email: 'test4@test.com', password: 'password', password_confirmation: 'password', first_name: 'Labelle', last_name: 'Merguez', phone_number: '1111111111')

puts '####### Creating vehicles #############'
file1 = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbLFKaIBd1Hs6MZGm8_Y4YE7MyTOFrWlBZrQ&usqp=CAU')
file2 = URI.open('https://www.motortrend.com/uploads/2022/03/1982_DeLorean_DMC-12_Time_Machine_Mecum_11.jpg')
file3 = URI.open('https://i.pinimg.com/736x/23/4c/9f/234c9f872637c7d20d75a1294df2fa2c.jpg')
file4 = URI.open('https://images.hdqwalls.com/wallpapers/batman-batmobile-img.jpg')
file5 = URI.open('https://i.pinimg.com/originals/68/1b/54/681b5411369353221a1109fbaff9237b.jpg')
file6 = URI.open('https://i.ytimg.com/vi/mL5DnlpNZC0/maxresdefault.jpg')
file7 = URI.open('https://static.hitek.fr/img/actualite/2017/02/09/fb_unnamed-18.webp')
file8 = URI.open('https://disney-planet.fr/wp-content/uploads/2016/11/tapis-magique-personnage-aladdin-06.jpg')
file9 = URI.open('http://www.etrepagny.fr/wp-content/uploads/2018/12/fabrication-traineau-pere-norel-etrepagny-2018-13.jpg')
file10 = URI.open('https://kultt.fr/wp-content/uploads/2018/06/chatbus-velo-Hiroshima-uai-640x360.jpg')
vehicle1 = Vehicle.create(user_id: User.first.id, name: 'Millenium Falcon', price: 10_000, city: 'Kiev', category: 'SF')
vehicle2 = Vehicle.create(user_id: User.first.id, name: 'DeLorean DMC-12', price: 1200, city: 'Rennes', category: 'SF')
vehicle3 = Vehicle.create(user_id: User.first.id, name: 'the Flying Dutchman', price: 2000, city: 'Saint-Domingue', category: 'Fantasy')
vehicle4 = Vehicle.create(user_id: User.last.id, name: 'Batmobile', price: 1900, city: 'Gotham City', category: 'Superheroes')
vehicle5 = Vehicle.create(user_id: User.last.id, name: 'Toyota Fast & Furious', price: 250, city: 'Los Angeles', category: 'Classical')
vehicle6 = Vehicle.create(user_id: User.last.id, name: 'Taxi with Sami as driver', price: 350, city: 'Marseille', category: 'Classical')
vehicle7 = Vehicle.create(user_id: User.last.id, name: 'The Magic Bus', price: 10, city: 'Moscou', category: 'Classical')
vehicle8 = Vehicle.create(user_id: User.last.id, name: 'Alladins Flying Carpet', price: 500, city: 'Khartoum', category: 'Fantasy')
vehicle9 = Vehicle.create(user_id: User.last.id, name: 'Santa Sleigh', price: 1, city: 'Ittoqqortoormiit', category: 'superheroes')
vehicle10 = Vehicle.create(user_id: User.last.id, name: 'Chat-Bus', price: 150, city: 'Tokyo', category: 'Fantasy')
vehicle1.images.attach(io: file1, filename: '1', content_type: "image/png")
vehicle2.images.attach(io: file2, filename: '2', content_type: "image/png")
vehicle3.images.attach(io: file3, filename: '3', content_type: "image/png")
vehicle4.images.attach(io: file4, filename: '4', content_type: "image/png")
vehicle5.images.attach(io: file5, filename: '5', content_type: "image/png")
vehicle6.images.attach(io: file6, filename: '6', content_type: "image/png")
vehicle7.images.attach(io: file7, filename: '7', content_type: "image/png")
vehicle8.images.attach(io: file8, filename: '8', content_type: "image/png")
vehicle9.images.attach(io: file9, filename: '9', content_type: "image/png")
vehicle10.images.attach(io: file10, filename: '10', content_type: "image/png")
puts '####### Saving Vehicles #############'
vehicle1.save
vehicle2.save
vehicle3.save
vehicle4.save
vehicle5.save
vehicle6.save
vehicle7.save
vehicle8.save
vehicle9.save
vehicle10.save

date1 = Date.new(2023, 2, 1)
date2 = Date.new(2023, 2, 5)

Booking.create(start: date1, end: date2, user_id: User.last.id, vehicle_id: Vehicle.first.id)

puts '####### Finished #############'
