require_relative '../app/item'
require 'date'

class Game
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer:, last_played_at:, published_date:, id: rand(1000))
    super(id, published_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?()end
end
