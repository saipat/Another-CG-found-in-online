require 'card'
require 'hand'

describe Card do

  card1 = Card.new(:spades, :ace)
  card2 = Card.new(:spades, :ten)
  card3 = Card.new(:hearts, :ace)

  describe "#beats?" do

    it "returns true if other card rank is smaller" do
      expect(card1.beats?(card2)).to be(true)
      expect(card2.beats?(card1)).to be(false)
    end

    it "returns false if other card rank is the same" do
      expect(card3.beats?(card1)).to be(false)
    end

  end

  describe "#ties?" do

    it "returns true if other card rank is the same" do
      expect(card1.ties?(card3)).to be(true)
      expect(card2.ties?(card1)).to be(false)
    end

  end

end
