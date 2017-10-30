# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cup.where(
  start_at: Time.new(2018, 05, 26),
  end_at: Time.new(2018, 05, 27)
).first_or_create(
  start_at: Time.new(2018, 05, 26),
  end_at: Time.new(2018, 05, 27),
  title_fr: "Coupe Miyama",
  title_en: "Miyama Cup",
  description_fr: "On fête les 10 ans des l'ELSJ!",
  description_en: "ELSJ partyyyy!")
