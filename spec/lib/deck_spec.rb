require "spec_helper"

RSpec.describe Deck do
  let(:deck) { Deck.new }

  describe "#create_deck" do
    it 'builds a deck of 52 cards' do
      expect(deck.deck.size).to eq 52
    end

    it 'creates unique Card objects' do
      expect(deck.deck).to be_a Array
      expect(deck.deck[1]).to be_a Card
    end

    it 'shuffles deck after being built' do
      expect(deck.deck.shuffle[0]).to_not eq deck.deck[0]
    end
  end

  describe "#deal" do
    it 'removes a number of cards from deck' do
      initial_size = deck.deck.size
      final_size = initial_size - 2

      deck.deal(2)
      expect(deck.deck.size).to eq final_size
    end
  end

end
