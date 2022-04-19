require_relative './item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(name, published_date, archived = false, on_spotify = false, id = Random.rand(1..1000))
    super(name, published_date, archived, id)
    @on_spotify = on_spotify
  end
  # rubocop:enable Style/OptionalBooleanParameter

  def can_be_archived?
    super && @on_spotify
  end
end
