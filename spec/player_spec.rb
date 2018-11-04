require 'player'

describe Player do
  subject(:player) do
    Player.new("Nick the Greek")
  end

  it "assigns the name" do
    expect(player.name).to eq("Nick the Greek")
  end

  describe "#lay_card" do
    let(:hand) { ["card1", "card2", "card3"] }
    before(:each) { player.hand = hand }

    it "removes top card from hand" do
      player.lay_card
      expect(player.hand).to eq(["card2", "card3"])
    end
  end

end
