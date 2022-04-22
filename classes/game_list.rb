require_relative './game.rb'
require_relative '../data/games_crud'

module GamesList
  def list_games
    if @games.empty?
      puts 'You don\'t have any games.'
    else
      @games.each_with_index do |game, index|
        puts "#{index + 1} multiplayer: #{game.multiplayer}, last_played_at: #{game.last_played_at}, published_date:#{game.published_date},
        id: #{game.id}"
        puts ''
      end
    end
    puts ''
  end

  def add_game
    print 'Is it a multiplayer game'
    multiplayer = gets.chomp
    print 'Publish date '
    published_date = gets.chomp
    print 'Last_played_date'
    last_played_at = gets.chomp

    games_data = { multiplayer: multiplayer, published_date: published_date, last_played_at: last_played_at }

    @games.push(games_data)
    save_game(@games)

    puts 'Game saved successfully!'
  end
end