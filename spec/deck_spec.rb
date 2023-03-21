require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do

  it "can return cards" do
    card1 =Card.new(:heart, "Jack", 11)
    deck = Deck.new([card1])
    expect(deck.cards). to eq [card1]
  end
  
  it "can return the card rank" do
    card1 =Card.new(:heart, "Jack", 11)
    deck = Deck.new([card1])
    expect(deck.rank_of_card_at(0)). to eq (11)
  end
 
  it "can return high ranking cards" do
    card1 =Card.new(:heart, "Jack", 11)
    card2 = Card.new(:club, "two", 2)
    card3 = Card.new(:spade, "Ace", 14)
    card4 = Card.new(:diamond, "seven", 7)
    deck = Deck.new([card1, card2, card3, card4])
    expect(deck.high_ranking_cards). to eq [card1, card3]
  end
 
  it "can calculate percent of high ranking cards" do
    card1 =Card.new(:heart, "Jack", 11)
    card2 = Card.new(:club, "two", 2)
    card3 = Card.new(:spade, "Ace", 14)
    card4 = Card.new(:diamond, "seven", 7)
    deck = Deck.new([card1, card2, card3, card4])
    expect(deck.percent_high_ranking). to eq 0.5
  end
  
  it "can remove cards" do
    card1 =Card.new(:heart, "Jack", 11)
    card2 = Card.new(:club, "two", 2)
    card3 = Card.new(:spade, "Ace", 14)
    card4 = Card.new(:diamond, "seven", 7)
    deck = Deck.new([card1, card2, card3, card4])
    deck.remove_card
    expect(deck.cards).to eq([card2, card3, card4])
  end

  it "can add cards" do
  card1 =Card.new(:heart, "Jack", 11)
  card2 = Card.new(:club, "two", 2)
  card3 = Card.new(:spade, "Ace", 14)
  card4 = Card.new(:diamond, "seven", 7)
  deck = Deck.new([card1, card2, card3, card4])
  card5 = Card.new(:spade, "five", 5)
  deck.add_card(card5) 
  expect(deck.cards).to eq([card1, card2, card3, card4, card5])
end
end