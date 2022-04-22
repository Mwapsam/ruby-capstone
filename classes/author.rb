require 'json'
require_relative './helper'

class Author
  attr_accessor :id, :first_name, :last_name
  attr_reader :items

  include Help

  def to_json(*_args)
      JSON.generate(
        {
          first_name: @first_name,
          last_name: @last_name,
          id: @id,
          items: @items
        }
      )
  end

  def self.from_json(json)
    item = Author.new(first_name: json['first_name'],
                      last_name: json['last_name'], id: json['id'])

    item.add_all_items(json['items'])
    item
  end

  def initialize(first_name:, last_name:, id: rand(1000))
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
