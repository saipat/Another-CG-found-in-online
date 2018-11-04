require_relative 'card'

# Represents a deck of playing cards.
class Deck
  
  # Returns an array of all 52 playing cards. Make sure to shuffle!
  def self.all_cards
    card_deck = []

    Card.suits.each do |suit|
      Card.values.each do |value|
        card_deck << Card.new(suit, value)
      end
    end

    card_deck.shuffle!
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  # Returns the number of cards in the deck.
  def count
    @cards.count
  end

  def empty?
    @cards.empty?
  end

  # Takes single cards from the top of the deck.
  def take_card
    raise "not enough cards" if empty?
    @cards.shift
  end

end
