require 'json'
require_relative '../classes/movie'

def load_movies
  movies_data = []
  if File.exist?('./data/movies.json')
    movies_json = File.read('./data/movies.json')
    if movies_json.empty?
      movies_data
    else
      JSON.parse(movies_json).each do |json|
        movies_data << Movie.from_json(json)
      end
    end
  else
    File.write('./data/movies.json', JSON.generate([]))
    movies_data
  end
end

def save_movies(movies)
  movies_data = JSON.generate(movies)
  File.write('./data/movies.json', movies_data)
end
