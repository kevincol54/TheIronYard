require 'sinatra'
require 'faker'

get '/' do
  "Party on Wayne! Party on Garth! excellllleeenntttt!"

 erb :index, layout: :index
end

get '/surfing' do
  # Faker::Address.city
  # Faker::Company.name 
  @surfers = [
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name},
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name},
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name},
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name},
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name},
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name},
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name},
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name},
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name},
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name}, 
  ]

    @para = Faker::Lorem.paragraphs(15).join(" ")

  erb :surfing, layout: :index
end

get '/snowboarding' do
  @snowboarders = [
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name},
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name},
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name},
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name},
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name},
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name},
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name},
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name},
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name},
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name}, 
  ]

    @para = Faker::Lorem.paragraphs(15).join(" ")

  erb :snowboarding, layout: :index
end

get '/skateboarding' do
  @skaters = [
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name},
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name},
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name},
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name},
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name},
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name},
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name},
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name},
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name},
    {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name}, 
  ]
  @para = Faker::Lorem.paragraphs(15).join(" ")

  erb :skateboarding, layout: :index


 
end
