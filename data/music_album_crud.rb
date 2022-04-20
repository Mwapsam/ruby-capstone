require 'json'

def save_music_albums(music_albums)
  music_albums_data = music_albums.map do |music_album|
    {
      name: music_album.name,
      published_date: music_album.published_date.to_i,
      archived: music_album.archived,
      on_spotify: music_album.on_spotify,
      id: music_album.id,
      genre_id: music_album.id
    }
  end

  File.write('./data/music.json', JSON.generate(music_albums_data), mode: 'w')
end

def load_music_albums
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
