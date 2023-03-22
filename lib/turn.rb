class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2, spoils_of_war=0)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = spoils_of_war
  end

  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    elsif player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    else
      :war
    end
  end

  def winner
    if self.type == basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1.deck.add_card(player2.deck.remove_card)
      else 
        player2.deck.add_card(player1.deck.remove_card)
      end
    elsif self.type == war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        3.times do
          player1.deck.add_card(player2.deck.remove_card)
        end
      else 
        3.times do
          player2.deck.add_card(player1.deck.remove_card)
        end
      end
    else 
        player1.deck.remove_card
        player2.deck.remove_card
      end
    end
  end

end