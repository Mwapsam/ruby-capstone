require_relative './console'
require_relative './music_album'
require_relative './genre'
require_relative './music_list'
require 'json'
require_relative '../data/genre_crud'
require_relative '../data/music_album_crud'

class App
  include Console
  include MusicList

  attr_accessor :books, :music_albums, :games, :genres,
                :lables, :authors

  def initialize
    @books = []
    @music_albums = []
    @games = []
    @genres = []
    @labels = []
    @authors = []
  end


  def run
    puts 'This method is for fetching data from json files'
    @music_albums = load_music_albums
    @genres = load_genres
  end
end
