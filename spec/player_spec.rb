require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do

  it "can have a name" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player1 = Player.new("Clarisa", deck)
    expect(player1.name). to eq ("Clarisa")
  end
  
  it "can have deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player1 = Player.new("Clarisa", deck)
    expect(player1.deck). to eq (deck)
  end
  
  it "can lose the game" do
    card1 = Card.new(:heart, "four", 4)
    card2 = Card.new(:spade, "King", 13)
    card3 = Card.new(:club, "three", 3)
    deck = Deck.new([card1, card2, card3])
    player = Player.new("Eric", deck)
    expect(player.has_lost?). to eq (false)
    3.times do 
      player.deck.remove_card
    end
    expect(player.has_lost?). to eq (true)
  end
end