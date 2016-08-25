require "spec_helper"

RSpec.describe Card do
  let(:card_1) { Card.new('♥', 'A') }
  let(:card_2) { Card.new('♣', 7) }
  let(:card_3) { Card.new('♦', 'J') }

  describe "#initialize" do
    it 'has a suit' do
      expect(card_1).to be_a(Card)
      expect(card_1.suit).to eq('♥')
      expect(card_1.rank).to eq('A')
      expect(card_1.value).to be_nil

      expect(card_2.suit).to eq('♣')
      expect(card_2.rank).to be_a(Fixnum)
      expect(card_2.value).to eq(7)

      expect(card_3.suit).to eq('♦')
      expect(card_3.rank).to eq('J')
      expect(card_3.value).to eq(10)
    end
  end

end
