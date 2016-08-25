require "spec_helper"

RSpec.describe Hand do
  let(:hand) { Hand.new }
  let(:hand_1) { Hand.new }
  let(:card_1) { Card.new('♥','A') }
  let(:card_2) { Card.new('♠', 7) }
  let(:card_3) { Card.new('♣', 'K')}

  describe "#initialize" do
    it 'has an empty array of cards' do
      expect(hand).to be_a Hand
      expect(hand.cards).to be_empty
    end
  end

  describe "#add_card" do
    it 'adds cards to the hand' do
      hand.add_card("Someone", [card_1, card_2])
      expect(hand.cards).to be_a Array
      expect(hand.cards).to include(a_kind_of(Card))
    end
  end

  describe "#calculate_hand" do
    it 'calculates the sum of current hand' do
      hand.add_card("Someone", [card_2, card_3])
      expect(hand.calculate_hand).to eq 17

      hand_1.add_card("Someone", [card_1, card_3])
      expect(hand_1.calculate_hand).to eq 21
    end
  end

end
