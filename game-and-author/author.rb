require_relative '../app/item'

class Author < Item
  attr_accessor :id, :first_name, :last_name, :items

  def initialize(id, first_name, last_name, items)
    super
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = items
  end

  def add_item(item)end
end
