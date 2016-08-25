require_relative 'card'
require_relative 'deck'
require 'pry'

class Hand
  attr_reader :deck, :cards, :hand_value
  def initialize
    @cards = []
  end

  def add_card(player, hand)
    hand.each do |card|
      @cards << card
      puts "#{player} was dealt #{card.rank} #{card.suit}"
    end
    puts "#{player} score: #{calculate_hand}"
    puts
  end

  def calculate_hand
    hand_value = 0
    ace_count = 0

    @cards.each do |card|
        if card.rank == 'A'
          ace_count += 1
        else
          hand_value += card.value
        end
      end
  
    if ace_count > 0
      if hand_value + 11 + (ace_count - 1) <= 21
        hand_value += (11 + (ace_count - 1))
      else
        hand_value += ace_count
      end
    end
    hand_value
  end

end
