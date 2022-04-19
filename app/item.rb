class Item
  attr_accessor :published_date, :name
  attr_reader :id, :archived

  def initialize(_id, name, published_date, archived: false)
    @id = Random.rand(1..1000)
    @name = name
    @published_date = published_date
    @archived = archived
  end

  def can_be_archived?
    published_date > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
