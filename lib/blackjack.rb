require 'pry'

require_relative "deck"
require_relative "hand"

class Blackjack
  attr_reader :deck, :player, :computer

  def initialize
    @deck = Deck.new
    @player = Hand.new
    @computer = Hand.new
  end

  def create_hand
    deck.deal(2)
  end

  def hit!(player, name)
    player.add_card("#{name}", deck.deal(1))
  end

  def stand!(player, name)
    "\n#{name} stands at #{player.calculate_hand}.\n"
  end

  def player_turn
    hand = create_hand
    player.add_card("Player", hand)

    input = ''

    until input == 's'
      if player.calculate_hand > 21
        puts "Bust! Game over..."
        exit
      else
        print "Hit or stand? (H/S): "
        input = gets.chomp.downcase
        puts
        case input
        when 's' then puts "Player score: #{player.calculate_hand}\n\n"
        when 'h' then hit!(player, "Player")
        else
          puts "Invalid input.\n"
        end
      end
    end
  end

  def dealer_turn
    hand = create_hand
    computer.add_card("Dealer", hand)

    while computer.calculate_hand < 17
      puts "Dealer score: #{computer.calculate_hand}"
      hit!(computer, "Dealer")
    end
    if computer.calculate_hand == 21
      puts "BLACKJACK! Dealer wins!"
      exit
    elsif computer.calculate_hand > 21
      puts "Dealer bust! You win!"
    else
      puts "Dealer stands."
    end
  end

  def compare_score
    player_score = player.calculate_hand
    computer_score = computer.calculate_hand

    if player_score <= 21 && computer_score <= 21
      if player_score > computer_score
        puts "\nYou win!"
      else
        puts "\nDealer wins!"
      end
    end
  end

end


puts "** Welcome to BLACKJACK! **"
puts
game = Blackjack.new
game.create_hand

game.player_turn

game.dealer_turn
game.compare_score
