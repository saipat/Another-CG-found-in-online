class Player
  attr_reader :name
  attr_accessor :hand

  def initialize(name)
    @name = name
    @hand = []
  end

  #removes top card from hand and returns it
  def lay_card
    @hand.shift
  end

end
