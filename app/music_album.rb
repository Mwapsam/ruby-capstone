require_relative './item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name, :published_date, :genre_id, :archived, :id

  # rubocop:disable Style/OptionalBooleanParameter, Metrics/ParameterLists
  def initialize(published_date, genre_id, name, on_spotify = false, archived = false, id = Random.rand(1..1000))
    super(name, published_date, archived, id)
    @name = name
    @published_date = published_date
    @id = id
    @archived = archived
    @genre_id = genre_id
    @on_spotify = on_spotify
  end
  # rubocop:enable Style/OptionalBooleanParameter, Metrics/ParameterLists

  def can_be_archived?
    super && @on_spotify
  end
end
