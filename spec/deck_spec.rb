require 'card'
require 'deck'

describe Deck do
  describe "::all_cards" do
    subject(:all_cards) { Deck.all_cards }

    it "starts with a count of 52" do
      expect(all_cards.count).to eq(52)
    end

    it "returns all cards without duplicates" do
      deduped_cards = all_cards
        .map { |card| [card.suit, card.value] }
        .uniq
        .count
      expect(deduped_cards).to eq(52)
    end
  end

  let(:cards) do
    cards = [
      Card.new(:spades, :king),
      Card.new(:spades, :queen),
      Card.new(:spades, :jack)
    ]
  end

  describe "#initialize" do
    it "by default fills itself with 52 cards" do
      deck = Deck.new
      expect(deck.count).to eq(52)
    end

    it "can be initialized with an array of cards" do
      deck = Deck.new(cards)
      expect(deck.count).to eq(3)
    end
  end

  let(:deck) do
    Deck.new(cards.dup)
  end

  it "does not expose its cards directly" do
    expect(deck).not_to respond_to(:cards)
  end

  describe "#take_card" do
    # **use the front of the cards array as the top**
    it "takes cards off the top of the deck" do
      expect(deck.take_card).to eq(cards.first)
    end

    it "removes cards from deck on take" do
      deck.take_card
      expect(deck.count).to eq(2)
    end

    it "doesn't allow you to take more cards than are in the deck" do
      expect do
      4.times do
        deck.take_card
      end
      end.to raise_error("not enough cards")
    end
  end

end
