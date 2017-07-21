# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

cohorts = [
  ['Jackrabbits', Date.new(2016,9,12), Date.new(2017,1,20)],
  ['Otters', Date.new(2016,10,20), Date.new(2017,2,10)],
  ['Squirrels', Date.new(2016,10,24), Date.new(2017,3,3)],
  ['Fireflies', Date.new(2016,11,14), Date.new(2017,3,24)],
  ['Foxes', Date.new(2016,12,5), Date.new(2017,4,14)],
  ['Chorus Frogs', Date.new(2017,1,3), Date.new(2017,5,5)],
  ['Bumblebees', Date.new(2017,1,23), Date.new(2017,5,26)],
  ['Fiddler Crabs', Date.new(2017,2,13), Date.new(2017,6,16)],
  ['Sea Lions', Date.new(2017,3,6), Date.new(2017,7,14)],
  ['Rock Doves', Date.new(2017,3,27), Date.new(2017,8,4)],
  ['Fiery Skippers', Date.new(2017,4,17), Date.new(2017,8,25)],
  ['Pocket Gophers', Date.new(2017,5,8), Date.new(2017,9,15)],
  ['Nighthawks', Date.new(2017,5,30), Date.new(2017,10,6)],
  ['Golden Bears', Date.new(2017,6,19), Date.new(2017,10,27)],
  ['Red Pandas', Date.new(2017,7,17), Date.new(2017,11,17)],
  ['Salamanders', Date.new(2017,8,7), Date.new(2017,12,8)]
]

cohorts.each { |cohort| Cohort.create(
  name: cohort[0],
  start: cohort[1],
  end: cohort[2],
  url: "chi-#{cohort[0].parameterize}-#{cohort[1].year}"
)}

Cohort.create(
  name: 'Staff',
  start: Date.new(2014,1,1),
  end: Date.new(2018,1,1),
  url: 'Devbootcamp'
)

load = ValidUserLoad.new

load.load_all_valid_users
