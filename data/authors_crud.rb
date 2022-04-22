require 'json'

def load_authors
  music_json = File.read('./data/music.json')
  music_album_data = []
  genres_data = load_genres
  if music_json.empty?
    music_album_data
  else
    JSON.parse(music_json).each do |music_album|
      music_item = MusicAlbum.new(music_album['name'], Time.at(music_album['published_date']),
                                  music_album['archived'], music_album['on_spotify'], music_album['id'])
      genres_data.each do |genre|
        music_item.add_genre = genre if genre.id == music_album['genre_id']
      end
      music_album_data.push(music_item)
    end
  end
  music_album_data
end