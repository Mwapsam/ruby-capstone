class Item
  attr_accessor :published_date, :name
  attr_reader :id, :archived, :genre

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(name, published_date, archived = false, id = Random.rand(1..1000))
    @id = id
    @name = name
    @published_date = published_date
    @archived = archived
  end
  # rubocop:enable Style/OptionalBooleanParameter

  def add_genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def can_be_archived?
    @published_date.year < Time.new.year - 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
