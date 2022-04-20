require_relative '.\item'

class Book < Item
  attr_accessor :cover_state

  def initialize(cover_state)
    super(name, published_date, archived, id)
    @publisher = name
    @cover_state = cover_state
  end

  def can_be_archived?
    super && @cover_state
  end
end
