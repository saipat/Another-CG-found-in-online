require 'war'
require 'player'
require 'hand'
require 'deck'
require 'card'

describe War do
  subject(:game) { War.new }
  let(:player_one) { game.player_one }
  let(:player_two) { game.player_two }

  describe "#deal_hands" do
    # let(:deck) { Deck.new(["card1", "card2", "card3", "card4"])}

    it "deals each player half the deck" do
      game.deal_hands
      expect(player_one.hand.count).to eq(26)
      expect(player_two.hand.count).to eq(26)
    end

    it "deals in alternating pattern"

  end

  describe "#lay_cards" do
    # let(:deck) { Deck.new(["card1", "card2", "card3", "card4"])}

    it "adds a card to face up pool from each player" do
      game.lay_cards
      expect(game.face_up_pool.keys.count).to eq(2)
    end

    it "removes card from each player's hand" do
      game.lay_cards
      expect(player_one.hand.count).to eq(25)
      expect(player_one.hand.count).to eq(25)
    end

  end

  describe "#tiebreaker" do

    it "adds a card to face down pool from each player" do
      game.tiebreaker
      expect(game.face_down_pool.count).to eq(2)
      expect(player_one.hand.count).to eq(25)
      expect(player_one.hand.count).to eq(25)
    end

  end

  describe "#reset_pools" do

    it "resets face_up_pool back to initial state" do
      game.lay_cards
      game.reset_pools
      expect(game.face_up_pool).to eq({})
    end

    it "resets face_down_pool back to initial state" do
      game.tiebreaker
      game.reset_pools
      expect(game.face_down_pool).to eq([])
    end

  end

  describe "#pay_winner" do

    it "adds total pool to winning player's hand (don't know how to test this)"

    it "resets pools" do
      game.lay_cards
      game.pay_winner
      expect(game.face_up_pool).to eq({})
      expect(game.face_down_pool).to eq([])

    end

  end

end
