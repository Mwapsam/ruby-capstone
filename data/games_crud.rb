require 'pry'
require 'json'
require_relative '../classes/game.rb'

def load_games
  games_json = File.read('./data/games.json')
  games_data = []
  if games_json.empty?
    games_data
  else
    #JSON.parse(games_json).each do |json|
    #  game_item = Game.new(json['multiplayer'],DateTime.parse(json['last_played_at']),DateTime.parse(json['published_date']),json['id'])
    #  games_data.push(game_item)
    #end
  JSON.parse(games_json).each do |json|
    games_data << Game.from_json(json)
  end

  end
  games_data
end

def save_game(games)
  #games_data = games.map do |game|
  #  {
  #    multiplayer: game[:multiplayer],
  #    last_played_at: game[:last_played_at],
  #    published_date: game[:published_date],
  #  }
  #end

  games_data = JSON.generate(games)
  File.write('./data/games.json', games_data)
end