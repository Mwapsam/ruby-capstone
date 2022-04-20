require_relative './helper'
require_relative './music_album'
require_relative '../data/music_album_crud'

module MusicList
  include Helper
  def list_music_albums
    if @music_albums.empty?
      puts 'You don\'t have any Music Albums.'
    else
      @music_albums.each_with_index do |music_album, index|
        print "#{index}) Album: #{music_album.name}, Genre: #{@genres.empty? ? 'No genre' : music_album.genre.name}, "
        print "Publish Date: #{time_format(music_album.published_date)}, Archived: #{music_album.archived}, "
        print "Spotify: #{music_album.on_spotify}"
        puts ''
      end
    end
    puts ''
  end
  # rubocop:disable Metrics/MethodLength

  def add_music_album
    print 'Album Name: '
    name = gets.chomp
    year = select_year
    month = select_month
    day = select_day

    print 'Is it on Spotify? (Y/N): '
    spotify_answer = gets.chomp.downcase
    until %w[y n].include?(spotify_answer)
      print 'Is it on Spotify? (Y/N): '
      spotify_answer = gets.chomp.downcase
    end

    music_album = MusicAlbum.new(name, Time.new(year, month, day), false, spotify_answer == 'y')

    unless @genres.empty?
      puts 'Select genre: '
      list_genres
      genre_index = gets.chomp.to_i
      music_album.add_genre = @genres[genre_index]
    end
    @music_albums.push(music_album)
    save_music_albums(@music_albums)
    puts 'Created a Music Album successfully!'
  end
  # rubocop:enable Metrics/MethodLength

  def list_genres
    if @genres.empty?
      puts 'You don\'t have any Genres.'
    else
      @genres.each_with_index do |genre, index|
        puts "#{index}) Genre: #{genre.name}"
      end
    end
  end
end
