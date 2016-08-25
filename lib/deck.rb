
require_relative 'card'
require 'pry'

class Deck
  SUITS = ['♦', '♣', '♠', '♥']
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  attr_accessor :deck

  def initialize
    @deck = create_deck
  end

  def create_deck
    deck = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        deck << Card.new(suit, rank)
      end
    end
    deck.shuffle!
  end

  def deal(num)
    deck.pop(num)
  end
end
# 
# deck = Deck.new
# cards = deck.deal(2)

# binding.pry
#
# full_deck = Deck.new
# full_deck.create_deck
# cards = deck.deal(2)
