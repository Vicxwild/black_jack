class Rules
  def points(cards)
    points = 0
    aces = []
    cards.each do |card|
      case card.face
      when Integer
        points += card.face
      when "T"
        aces << card
      else
        points += 10
      end
    end
    aces.each do
      points += if points >= 11
                  1
                else
                  11
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
