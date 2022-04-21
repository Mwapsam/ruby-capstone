class Author
  attr_accessor :id, :first_name, :last_name
  attr_reader :items

  def initialize(first_name:, last_name:, id: rand(1000))
    super
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_author self
  end
end
