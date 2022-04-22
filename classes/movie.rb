require 'json'
require_relative './helper'
require_relative '../app/item'

class Movie < Item
  attr_accessor :movie_name, :published_date
  attr_reader :items

  include Help

  def to_json(*_args)
    JSON.generate({ name: @movie_name, published_date: @published_date })
  end

  def self.from_json(json)
    Movie.new(json['movie_name'], json['published_date'])
  end

  def initialize(movie_name, published_date)
    @movie_name = movie_name
    @published_date = published_date
    super(id, published_date)
  end

  def can_be_archived?
    super
  end
end
