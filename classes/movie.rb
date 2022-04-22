require 'json'
require_relative './helper'
require_relative '../app/item'


class Movie < Item
  attr_accessor :id, :name, :published_date
  attr_reader :items

  include Help

  def to_json(*_args)
    JSON.generate({ id: @id, name: @name, published_date: @published_date })
  end

  def self.from_json(json)
    Movie.new(json['name'], json['published_date'])
  end

  def initialize(name, published_date, id = rand(1000))
    @id = id
    @name = name
    @published_date = published_date
    @items = []
  end

  def can_be_archived?
    super || @silent
  end
end
