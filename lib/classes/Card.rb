# CARD IS A CHILD CLASS
require_relative "Deck"

class Card < Deck
  attr_accessor :card_id, :deck, :card_name, :description

  def initialize(card_id, deck, card_name, description)
    @card_id = card_id
    @deck = deck
    @card_name = card_name
    @description = description
    # Deck.add_card(deck)
  end 

  def to_a
    [@card_id, @deck, @card_name, @description] 
  end

end
    

# ruby = Deck.new(nil, "ruby deck", "ruby")
# ruby_card_one = Card.new("file handling", "something to do with files", ruby)
