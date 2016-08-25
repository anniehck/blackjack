require "spec_helper"

RSpec.describe Blackjack do
  let(:game) { Blackjack.new }

  describe "#initialize" do
    it 'has a deck, player hand and computer hand' do
      expect(game.deck).to be_a Deck
      expect(game.player).to be_a Hand
      expect(game.computer).to be_a Hand
    end
  end

  describe "#create_hand" do
    it 'deals two cards' do
      expect(game.create_hand).to include Card
      expect(game.create_hand.count).to eq 2
    end
  end

  describe "#hit!" do
    it 'deals another card' do
      player = Hand.new
      hand = game.create_hand
      player.add_card("Player", hand)

      game.hit!(player, "Player")
      expect(player.cards.count).to be 3

    end
  end



end
