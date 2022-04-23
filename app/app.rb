require_relative './console'
require_relative './music_album'
require_relative './genre'
require_relative './music_list'
require_relative './book'
require_relative './book_list'
require 'json'
require_relative '../data/genre_crud'
require_relative '../data/music_album_crud'
require_relative '../data/book_crud'
require_relative '../data/label_crud'

require_relative '../classes/game_list'
require_relative '../data/games_crud'

require_relative '../classes/authors_list'
require_relative '../data/authors_crud'

require_relative '../classes/movies_list'
require_relative '../data/movies_crud'

class App
  include Console
  include MusicList
  include Booklist
  include GamesList
  include AuthorsList
  include MoviesList

  attr_accessor :books, :music_albums, :games, :authors, :genres,
                :lables, :authors_data, :games_data, :movies, :movies_data

  def initialize
    @books = []
    @music_albums = []
    @games = []
    @genres = []
    @labels = []
    @authors = []
    @movies = []
  end

  def run
    @music_albums = load_music_albums
    @genres = load_genres
    @books = populate_books
    @labels = populate_labels
  end
end
