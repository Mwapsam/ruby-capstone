class App
  attr_accessor :books, :music_albums, :games, :genres, :labels, :authors

  def initialize
    @books = []
    @music_albums = []
    @games = []
    @genres = []
    @labels = []
    @authors = []
  end

  def welcome
    puts 'Welcome to our Ruby Capstone!!'
  end
end
