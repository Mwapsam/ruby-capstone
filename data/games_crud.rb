require 'json'
require_relative '../classes/game'

def load_games
  games_data = []
  return unless File.exist?('./data/games.json')

  games_json = File.read('./data/games.json')
  if games_json.empty?
    games_data
  else
    JSON.parse(games_json).each do |json|
      games_data << Game.from_json(json)
    end
  end
  File.write('./data/games.json', JSON.generate([]))
  games_data
end

def save_game(games)
  games_data = JSON.generate(games)
  File.write('./data/games.json', games_data)
end
