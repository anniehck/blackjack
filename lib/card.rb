# require_relative 'deck'

class Card
  attr_reader :suit, :rank, :value

  def initialize(suit, rank)
    @suit = suit
    @rank = rank

    @value = 10 if ['J', 'Q', 'K'].include?(@rank)
    @value = @rank if rank.class == Fixnum
    # @value = 11 if rank == 'A'
  end

end
