# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cup = Cup.where(
            start_at: Time.new(2018, 05, 26),
            end_at: Time.new(2018, 05, 27)
          ).first_or_create(
            start_at: Time.new(2018, 05, 26),
            end_at: Time.new(2018, 05, 27),
            title_fr: "Coupe Miyama",
            title_en: "Miyama Cup",
            description_fr: "On fête les 10 ans des l'ELSJ!",
            description_en: "ELSJ partyyyy!")

cup.errors.full_messages.each { |message| puts message } if cup.errors.any?

page = Page.where(param: "home").first_or_create(
                                    param: 'home',
                                    title_fr: "Accueil",
                                    title_en: "Home",
                                    cup_id: Cup.first.id
                                  )
page.errors.full_messages.each { |message| puts message } if page.errors.any?


if Rails.env == 'development'
  Admin.where(email: 'admin@email.com').first_or_create(email: 'admin@email.com', password: 'password')
end
