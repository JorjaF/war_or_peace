require 'Rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do

  it "has 2 players" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player1 = Player.new("Jorja", deck)
        
    card4 = Card.new(:heart, "four", 4)
    card5 = Card.new(:spade, "King", 13)
    card6 = Card.new(:club, "three", 3)
    deck2 = Deck.new([card4, card5, card6])
    player2 = Player.new("Tim", deck)
    
    expect(player1.name). to eq ("Jorja")
    expect(player2.name). to eq ("Tim")
  end

  it "has a turn type" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player1 = Player.new("Jorja", deck)
        
    card4 = Card.new(:heart, "four", 4)
    card5 = Card.new(:spade, "King", 13)
    card6 = Card.new(:club, "three", 3)
    deck2 = Deck.new([card4, card5, card6])
    player2 = Player.new("Tim", deck2)
    
    turn = Turn.new(player1, player2)
    expect(turn.type). to eq (:basic)
  end
    
    it "has a winner when it is basic" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      player1 = Player.new("Jorja", deck)
          
      card4 = Card.new(:heart, "seven", 7)
      card5 = Card.new(:spade, "King", 13)
      card6 = Card.new(:club, "three", 3)
      deck2 = Deck.new([card4, card5, card6])
      player2 = Player.new("Tim", deck2)
      
      turn = Turn.new(player1, player2)
      expect(turn.winner). to eq (player1)

    end
    it "has a winner when it is war" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      player1 = Player.new("Jorja", deck)
          
      card4 = Card.new(:heart, "Queen", 12)
      card5 = Card.new(:spade, "King", 13)
      card6 = Card.new(:club, "three", 3)
      deck2 = Deck.new([card4, card5, card6])
      player2 = Player.new("Tim", deck2)
      
      turn = Turn.new(player1, player2)
      expect(turn.winner). to eq (player1)

    end
  end
  