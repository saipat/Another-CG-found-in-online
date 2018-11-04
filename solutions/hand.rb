#Completed for you :)

class Hand

  attr_accessor :cards

  def initialize(cards = [])
    @cards = []
  end


  def empty?
    @cards.empty?
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end

end
