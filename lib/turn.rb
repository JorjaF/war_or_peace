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
    if self.type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      else 
        player2
      end
    elsif self.type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      else 
        player2
      end
    else 
      if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
          player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
        "NO WINNER!!!"
      end
    end
  end

  def pile_cards
    if self.type == :basic
        player1.cards.shift && player2.cards.shift
    end
  end
end