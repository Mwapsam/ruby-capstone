require_relative './item'

class Book < Item
  attr_accessor :name, :published_date, :cover_state, :publisher

  def initialize(publisher, cover_state, name, published_date, id = Random.rand(1..1000))
    super(name, published_date, id)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
