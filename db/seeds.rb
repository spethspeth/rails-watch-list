# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# http://tmdb.lewagon.com/movie/top_rated?api_key=<your_api_key>

require "json"
require 'open-uri'

movielist = URI.open('http://tmdb.lewagon.com/movie/top_rated?api_key=<your_api_key>').read
movieparsed = JSON.parse(movielist)
movies = movieparsed["results"]

movies.each do |movie|
  newmovie = Movie.new
  newmovie.title = movie["title"]
  newmovie.overview = movie["overview"]
  newmovie.poster_url = "https://image.tmdb.org/t/p/w500/#{movie['poster_path']}"
  newmovie.rating = movie["vote_average"]
  newmovie.save!
end

List.new(name: "Anime").save!
List.new(name: "Drama").save!
List.new(name: "Blockbuster").save!
List.new(name: "Bollywood").save!
