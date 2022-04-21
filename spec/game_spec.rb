require_relative '../classes/game'
require 'date'

def create_a_game(last_played_year = 2000, publish_year = 2000)
  Game.new(
    multiplayer: true,
    last_played_at: DateTime.parse("#{last_played_year}-01-01"),
    published_date: DateTime.parse("#{publish_year}-01-01"),
    id: 1000
  )
end

end