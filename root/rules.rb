class Rules

  def points(cards)
    points = 0
    aces = []
    cards.each do |card|
      if card.face.is_a?(Integer)
        points += card.face
      elsif card.face == "T"
        aces << card
      else
        points += 10
      end
    end
    aces.each do
      if points >= 11
        points += 1
      else
        points += 11
      end
    end
    points
  end

  def detect_winner(player, dealer)
    player_points = points(player.cards)
    dealer_points = points(dealer.cards)
    return if player_points == dealer_points

    player_points > dealer_points ? [player, dealer] : [dealer, player]

  end

  def cards_overflow?(cards)
    points(cards) > 21
  end
end
