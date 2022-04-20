require 'json'
require_relative '../app/genre'

def load_genres
  genre_json = File.read('./data/genre.json')
  genre_data = []
  if genre_json.empty?
    genre_data
  else
    JSON.parse(genre_json).map do |genre|
      genre_data.push(Genre.new(genre['name'], genre['id']))
    end
  end
  genre_data
end
