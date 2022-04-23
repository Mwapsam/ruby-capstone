require_relative '../app/item'
require 'date'
require 'json'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :published_date

  def initialize(multiplayer, last_played_at, published_date, id = Random.rand(1..1000))
    super(id, published_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def to_json(*_args)
    JSON.generate({ multiplayer: @multiplayer, last_played_at: @last_played_at, published_date: @published_date })
  end

  def self.from_json(json)
    Game.new(json['multiplayer'], json['last_played_at'], json['published_at'])
  end

  private

  def can_be_archived?
    diff = DateTime.now.year - @last_played_at.year
    super && (diff > 2)
  end
end
