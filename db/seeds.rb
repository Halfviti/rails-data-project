# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'net/http'
require 'json'

Appearance.destroy_all
Character.destroy_all
Film.destroy_all
Species.destroy_all
Planet.destroy_all

def consume(url)
  results = Array.new
  while(url != nil)
    uri = URI(url)
    response = Net::HTTP.get(uri)
    payload = JSON.parse(response)
    results += payload['results']
    url = payload['next']
  end
  return results
end

url_base = 'https://swapi.co/api/%s/?format=json'

url = url_base % 'people'
people = consume(url)
puts 'People accessed from API'

url = url_base % 'planets'
planets = consume(url)
puts 'Planets accessed from API'

url = url_base % 'films'
films = consume(url)
puts 'Films accessed from API'

url = url_base % 'species'
species = consume(url)
puts 'Species accessed from API'

for planet in planets do
  Planet.create(name: planet['name'],
                rotation_period: planet['rotation_period'],
                orbital_period: planet['orbital_period'],
                climate: planet['climate'],
                terrain: planet['terrain'],
                population: planet['population'])
end

puts 'Planets created'


for person in people do

  planet = planets.select { |p| p['url'] == person['homeworld'] }.first
  homeworld = Planet.where(:name => planet['name']).first
  
  char = Character.create(name: person['name'],
                          homeworld: homeworld)

end

puts 'Characters created'

for film in films do
  characters = people.select { |p| film['characters'].include? p['url']}
                     .map {|p| Character.where(:name => p['name']).first}

  Film.create(title: film['title'],
              episode_id: film['episode_id'],
              opening_crawl: film['opening_crawl'],
              characters: characters)
end

puts 'Films created'

for sp in species do

  planet = planets.select { |p| p['url'] == sp['homeworld'] }.first

  homeworld = planet != nil ? Planet.where(:name => planet['name']).first : nil

  new_species = Species.create(name: sp['name'],
                               classification: sp['classification'],
                               designation: sp['designation'],
                               language: sp['language'],
                               homeworld: homeworld )
end

puts 'Species created'