require 'json'

def save_music_albums(music_albums, music_album_add_genre)
  music_albums_data = music_albums.map do |music_album|
    {
      published_date: music_album.published_date.to_i,
      genre_id: music_album_add_genre,
      name: music_album.name,
      on_spotify: music_album.on_spotify,
      archived: music_album.archived,
      id: music_album.id
    }
  end

  File.write('./data/music.json', JSON.generate(music_albums_data))
end

# rubocop:disable Metrics/MethodLength
def load_music_albums
  music_album_data = []
  return unless File.exist?('./data/music.json')

  music_json = File.read('./data/music.json')

  genres_data = load_genres
  if music_json.empty?
    music_album_data
  else
    JSON.parse(music_json).each do |music_album|
      music_item = MusicAlbum.new(Time.at(music_album['published_date']),
                                  music_album['genre_id'],
                                  music_album['name'],
                                  music_album['on_spotify'],
                                  music_album['archived'],
                                  music_album['id'])
      genres_data.each do |genre|
        music_item.add_genre = genre if genre.id == music_album['genre_id']
      end
      music_album_data.push(music_item)
    end
  end
  music_album_data
  # rubocop:enable Metrics/MethodLength
end
