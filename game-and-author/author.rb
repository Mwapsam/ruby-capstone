require_relative '../app/item'

class Author < Item
  attr_accessor :id, :first_name, :last_name
  attr_reader :items

  def initialize(id: rand(1000), first_name:, last_name:)
    super
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
