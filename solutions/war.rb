require_relative 'card'
require_relative 'deck'
require_relative 'hand'
require_relative 'player'

class War

  attr_accessor :total_pool, :face_up_pool, :face_down_pool, :deck, :hand
  attr_reader :player_one, :player_two

  def initialize(player_one = Player.new("player_one"), player_two = Player.new("player_two"))
    @deck = Deck.new
    @player_one = player_one
    @player_two = player_two

    @face_up_pool = Hash.new { |hash, key| hash[key] = [] }
    @face_down_pool = []
    deal_hands
  end

  #deals cards to players in alternating pattern until the deck is empty.
  def deal_hands
    until deck.empty?
      @player_one.hand << deck.take_card
      @player_two.hand << deck.take_card
    end
  end


  #adds one card from each player to the face_down_pool
  def tiebreaker
    @face_down_pool << player_one.lay_card << player_two.lay_card
  end

  #adds the total_pool to player with winning card and then resets the pools.
  def pay_winner
    if current_card(player_one).beats?(current_card(player_two))
      @player_one.hand += @face_up_pool.values.flatten
      @player_one.hand += @face_down_pool
    else
      @player_two.hand += @face_up_pool.values.flatten
      @player_two.hand += @face_down_pool
    end

    reset_pools
  end

  #resets face_up_pool and face_down_pool to original state
  def reset_pools
    @face_up_pool = Hash.new { |hash, key| hash[key] = []}
    @face_down_pool = []
  end



  #adds one card from each player to face_up_pool
  def lay_cards
    @face_up_pool[player_one] << @player_one.lay_card
    @face_up_pool[player_two] << @player_two.lay_card
  end

  def over?
    player_one.hand.empty? || player_two.hand.empty?
  end

  def play
    until over?
      lay_cards
      tie ? tiebreaker : pay_winner
    end
    puts declare_winner
  end

  def tie
    current_card(player_one).ties?(current_card(player_two))
  end

  def declare_winner
    player_one.hand.empty? ? "#{player_two.name} wins!" : "#{player_one.name} wins!"
  end

  def current_card(player)
    face_up_pool[player].last
  end

end
