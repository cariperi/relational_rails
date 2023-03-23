# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Beer.destroy_all
Brewery.destroy_all

talea = Brewery.create!(name: "Talea Beer Co.",
                          city: "New York, NY",
                          tanks: 15,
                          has_license: true)
jester = Brewery.create!(name: "Jester King",
                          city: "Austin, TX",
                          tanks: 10,
                          has_license: false)
robot = Brewery.create!(name: "Human Robot",
                          city: "Philadelphia, PA",
                          tanks: 6,
                          has_license: true)

talea.beers.create!(name: "Weekender",
                    style: "Light Lager",
                    ibu: 7,
                    abv: 5,
                    fermentation_completed: true)
talea.beers.create!(name: "Sun Up",
                    style: "New England IPA",
                    ibu: 38,
                    abv: 6,
                    fermentation_completed: false)

jester.beers.create!(name: "Simple Means",
                    style: "Altbier",
                    ibu: 26,
                    abv: 6,
                    fermentation_completed: true)
jester.beers.create!(name: "Ghost Cannon",
                    style: "DIPA",
                    ibu: 65,
                    abv: 8,
                    fermentation_completed: false)

robot.beers.create!(name: "Snow Day",
                    style: "American Stout",
                    ibu: 42,
                    abv: 7,
                    fermentation_completed: false)
robot.beers.create!(name: "Tin Hoagie",
                    style: "Light Lager",
                    ibu: 11,
                    abv: 4,
                    fermentation_completed: true)
