require_relative '../app/music_album'

describe MusicAlbum do
  before :each do
    @music = MusicAlbum.new(Time.new(2021, 0o5, 16), 'Pop', 'Stay', false, true, 442)
  end

  context 'When testing the MusicAlbum class' do
    it 'should have an object with the instance of MusicAlbum' do
      music_class = @music.class

      expect(music_class).to be MusicAlbum
    end

    it 'should return a boolean value depending on published_date (longer than 10 years) and is on spotify' do
      music_archived = @music.can_be_archived?

      expect(music_archived).to eq false

      @music.on_spotify = true

      music_archived = @music.can_be_archived?

      expect(music_archived).to eq false
    end
  end
end
