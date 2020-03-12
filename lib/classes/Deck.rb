# require_relative "Card"
# DECK IS A PARENT CLASS

class Deck

  attr_reader :familiarity_rate, :test_counts, :id, :date_created
  attr_accessor :date_modified, :topic, :deck_name

  @@deck_counts = 0

  def initialize(id, deck_name, topic)
    @id = id
    @deck_name = deck_name
    @date_created = Time.new.to_s[0, 10]  
    @date_modified = @date_created
    @familiarity_rate = 0
    @card_counts = 0
    @test_counts = 0
    @familiar_card_counts = 0
    @topic = topic
  end

  def calculate_familiarity_rate # divide {familiar_card_counts} by {card_counts}
    @familiarity_rate = familiar_card_counts / card_counts
  end

  def to_a
    [@id, @deck_name, @topic]
  end

# INCREMENTING COUNTS FOR CLASS VAR AND INSTANCE VAR

  # def self.add_card_to_count # add everytime a card is created from Card class 
  #   card_counts += 1
  # end

  # def add_card(deck)
  #   self.class.add_card_to_count
  # end

  class << self
    attr_accessor :deck_counts, :card_counts

    def add_deck_to_count
      @@deck_counts += 1
    end

    def add_test_to_count # add everytime a practice is attempted
      @test_counts += 1
    end

    def add_familiar_card_to_count
      @familiar_card_counts += 1
    end

  end

  def view_deck(deck_name) 
    if deck_name == @deck_name
    end
  end

  def del_deck(deck_name)

  end

  def back_to_main_menu
    # go back to main menu
  end

end