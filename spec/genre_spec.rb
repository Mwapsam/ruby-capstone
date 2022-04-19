require_relative '../app/genre'

describe Genre do
  before :each do
    @genre = Genre.new('Pop')
  end

  context 'When testing Genre' do
    it 'should have an object with the instance' do
      genre_class = @genre.class

      expect(genre_class).to be Genre
    end

    it 'should add an object to items array' do
      music_albums = double('MusicAlbum', name: 'drivers license (2021)')

      allow(music_albums).to receive(:add_genre=) { @genre }

      @genre.add_item(music_albums)
      genre_items = @genre.items

      expect(genre_items.length).to eq 1
    end
  end
end
