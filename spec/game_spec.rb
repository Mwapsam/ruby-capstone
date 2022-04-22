require_relative '../classes/game'
require 'date'

def create_a_game(last_played_year = 2000, publish_year = 2000)
  Game.new(true, DateTime.parse("#{last_played_year}-01-01"), DateTime.parse("#{publish_year}-01-01"), 1000)
end
describe Game do
  it 'move game to archive unless publish date is more than 10 years' do
    publish_year = DateTime.now.year.to_i - 10
    last_played_year = DateTime.now.year.to_i - 3
    game = create_a_game(last_played_year, publish_year)
    game.move_to_archive
    is_archived = game.archived
    expect(is_archived).to eq false
  end

  describe 'last publish date more than 10 years ago' do
    before :all do
      @publish_year = DateTime.now.year.to_i - 11
    end
    it 'moves game to archive if last played more than 2 years ago' do
      last_played_year = DateTime.now.year.to_i - 3
      game = create_a_game(last_played_year, @publish_year)
      game.move_to_archive
      is_archived = game.archived
      expect(is_archived).to eq true
    end

    it 'should not move game to archive if game was last played more than 2 years ago' do
      last_played_year = DateTime.now.year.to_i - 2
      game = create_a_game(last_played_year, @publish_year)
      game.move_to_archive
      is_archived = game.archived
      expect(is_archived).to eq false
    end
  end
end
