require_relative "noname/version"
require_relative "classes/Deck"
require_relative "classes/Card"
require "csv"
require "colorize"
require "colorized_string"
require "tty-font"

# first menu
def start(decks_array, cards_array)
  sleep(1)
  puts
  puts ColorizedString["WELCOME TO STURDY CARDS"].colorize(:green)
  puts
  puts "📚" + (" " * 11) + "📚"
  puts "¯\\_( ͡♥ ͜ʖ ͡♥)_/¯"
  puts
  puts "1. Decks"
  puts "2. Learning Mode >> Current Progress"
  puts "3. Exit"
  print "> "
  selection = gets.chomp.to_i
  puts
  case selection
    when 1 
      deck_menu(decks_array, cards_array)
    when 2 
      # In progress
    when 3 
      exit
    else 
      sleep(2)
      puts "Taking you back to the main menu :)"
      start
  end 
end   

# second menu / deck menu
def deck_menu(decks_array, cards_array)
  sleep(1)
  puts "Please select one of the following:"    
  puts
  puts "1. View Deck" # done
  puts "2. Create Deck" # done - last step is to push to csv
  puts "3. Update Deck" 
  puts "4. Delete Deck" 
  puts "5. Main Menu"
  puts "6. Exit"
  print "> "
  # p decks_array
  selection = gets.chomp.to_i
  puts
  case selection
    when 1
      deck = view_deck(decks_array, cards_array)
    when 2 
      create_deck(decks_array)
    when 3
      update_deck(decks_array)
    when 4
      del_deck(decks_array) # this will have cards array too
    when 5
      sleep(2)
      puts "Taking you back to the main menu :)"
      start
    when 6
      exit
    else
      sleep(2)
      puts "Taking you back to the main menu :)"
      start
  end 
end

# view deck

def view_deck(decks_array, cards_array)
  viewing = true
  valid_deck_id = false
    while viewing
      sleep(1)
      # p decks_array
      puts "-" * 30
      puts "ID Deck Name"
      puts "-" * 30
      sleep(1)
      decks_array.each do |deck| # data in deck is in string format
      puts "#{deck.id}. #{deck.deck_name}"
      end 
      puts "Which deck would you like to view? Select a deck using the id: "
      print "> "
      which_deck = gets.chomp# input = deck id
      sleep(1)
      if decks_array.include? decks_array[which_deck.to_i - 1]
        viewing = false # breaks the loop a deck is found
        deck_name = nil
        decks_array.each do |deck| # deck = object in decks_array
          if deck.id.to_i == which_deck.to_i
            puts
            puts "#{deck.deck_name.upcase}"
            puts "-" * 40
            puts "1. ID:                  |  #{deck.id}"
            puts "2. Deck Name:           |  #{deck.deck_name.capitalize}"
            puts "3. Topic Name:          |  #{deck.topic.capitalize}"
            puts "4. Date Created:        |  #{deck.date_created}"
            puts "5. Date Modified:       |  #{deck.date_modified}"
            puts "6. No. of Cards:        |  #{deck.card_counts}"
            puts "7. No. of Tests Taken:  |  #{deck.test_counts}"
            puts "8. Familiarity:         |  #{deck.familiarity_rate}"
            puts "-" * 40

            deck_name = deck.deck_name
          
          end
        end 
      else
          sleep(1)
          puts ColorizedString["Deck id #{which_deck} does not exist! Please enter the correct id: "].red
      end
      # view cards from deck

  card_menu(cards_array, deck_name)
    end
end 

# card section - view card

def card_menu(cards_array, deck_name)
  sleep(1)
    puts "You are in Deck #{deck_name}"
    puts "Please select one of the following:"    
    puts "" 
    puts "1. View Cards" # done
    puts "2. Create Cards" # done - last step is to push to csv
    puts "3. Update Cards" 
    puts "4. Delete Cards" 
    puts "5. Go back to Deck Menu"
    puts "6. Exit"
    print "> "
    # p decks_array
    selection = gets.chomp.to_i
    puts
    case selection
      when 1
        card = view_cards(cards_array, deck_name)
      when 2 
        create_cards(cards_array, deck_name)
      when 3
        update_cards(cards_array, deck_name)
      when 4
        del_cards(cards_array, deck_name)
      when 5
        sleep(2)
        puts "Taking you back to deck menu :)"
        deck_menu
      when 6
        exit
      else
        sleep(2)
        puts "Taking you back to the main menu :)"
        start
    end
end

# view cards

def view_cards(cards_array, deck_name)
  viewing_card = true
    while viewing_card
    sleep(1)
    # p cards_array
    puts "-" * 30 * 2
    puts "Card Name                               Description"
    puts "-" * 30 * 2
    sleep(1)
    cards_array.each do |card| # data in card is in string format
      if card.deck == deck_name.downcase
      puts "#{card.card_name}                     #{card.description}"
      end
    end 
    puts "-" * 30 * 2
    puts "Which card would you like to view? Select a card using the id: "
    print "> "
    card_id = gets.chomp# input = card id
    sleep(1)
    if cards_array.include? cards_array[card_id.to_i - 1]
      viewing_card = false # breaks the loop a deck is found
      card_name = nil
      cards_array.each do |card| # card = object in cards_array
        if card.card_id.to_i == card_id.to_i
          puts
          puts "#{card.deck}"
          puts "#{card.card_name.upcase}"
          puts "-" * 40
          # puts "1. Card ID:             |  #{card.card_id}"
          puts "1. Card Name:           |  #{card.card_name.capitalize}"
          puts "2. Description Name:    |  #{card.description.capitalize}"
          # puts "4. Date Created:        |  #{deck.date_created}"
          # puts "5. Date Modified:       |  #{deck.date_modified}"
          # puts "6. No. of Cards:        |  #{deck.card_counts}"
          # puts "7. No. of Tests Taken:  |  #{deck.test_counts}"
          # puts "8. Familiarity:         |  #{deck.familiarity_rate}"
          puts "-" * 40
        end
      end
    else
      puts ColorizedString["Card id #{card_id.to_s} does not exist. Please enter a valid card id: "].red
    end
  end
end

# create cards

def create_cards(cards_array, deck_name)
sleep(1)
creating_card_name = true
card_name = nil
description = nil
  puts "What's the name of the card that you want to create?"
  print "> "
  while creating_card_name
    card_input = gets.chomp.downcase
    if valid_card_name?(cards_array, card_input) # need include deck name comparison as well. because duplicates can exist as long as cards are in different decks.
    # Create a new card
      sleep(1)
      puts "#{card_input.upcase} is available! Now, enter a description: "
      card_name = card_input
      description = gets.chomp.downcase
      card_id = (cards_array[-1].card_id.to_i + 1).to_s
      cards_array << Card.new(card_id,deck_name, card_name, description)
      write_to_csv_card(cards_array[-1])
      puts
      sleep(1)
      puts ColorizedString["\"#{card_name.capitalize}\" card has been successfully created!"].green
      creating_card_name = false
    else
      sleep(1)
      puts "Card name #{card_input.upcase} already exists. Please enter another name: "
      print "> "
    end
  end
end

# 

def valid_name?(decks_array, name)
  decks_array.each do |deck|
    if deck.deck_name == name
      return false
    end
  end
  return true
end

def valid_topic_name?(decks_array, topic)
  decks_array.each do |deck|
    if deck.topic == topic
      return false
    end
  end
  return true
end

def valid_card_name?(cards_array, card_input)
  cards_array.each do |card|
    if card.card_name == card_input
      return false
    end
  end
  return true
end

# create deck
def create_deck(decks_array)
sleep(1)
creating_name = true
name = nil
topic = nil
  puts "What's the name of the deck that you want to create?"
  print "> "
  while creating_name
    name_input = gets.chomp.downcase
    if valid_name?(decks_array, name_input)
    # Create a new deck
      sleep(1)
      puts "#{name_input.upcase} is available! Now, name a topic: "
      name = name_input
      topic = gets.chomp.downcase
      id = (decks_array[-1].id.to_i + 1).to_s
      decks_array << Deck.new(id, name, topic)
      write_to_csv(decks_array[-1])
      puts
      sleep(1)
      puts "\"#{name.capitalize}\" deck has been successfully created!"
      creating_name = false
    else
      sleep(1)
      puts "Deck name #{name_input.upcase} already exists. Please enter another name: "
      print "> "
    end
  end
  # while creating_topic
  #     topic_input = gets.chomp.downcase
  #     if valid_topic_name?(decks_array, topic_input)
  #       puts "#{topic_input.upcase} is available!"
  #       creating_topic = false
  #       topic = topic_input
  #     else
  #       puts "Topic name #{topic_input.upcase} already exists. Please enter another topic: "
  #       print "> "
      # end
end

def write_to_csv(deck)
  CSV.open("database/decks.csv", "ab") do |csv|
    csv << [deck.id, deck.deck_name, deck.topic]
  # p csv
  end 
end 

def write_to_csv_card(card)
  CSV.open("database/cards.csv", "ab") do |csv|
    csv << [card.card_id, card.deck, card.card_name, card.description]
  end
end

def update_csv(decks_array)
  CSV.open("database/decks.csv", "w+") do |csv|
    csv << ['id','deck name','topic']
    decks_array.each do |deck|
      csv << deck.to_a
    end
  end 
end 

# update deck

def update_deck(decks_array)
  sleep(1)
  updating = true
    puts "-" * 30
    puts "ID Deck Name"
    puts "-" * 30
    sleep(1)
    decks_array.each do |deck|
      puts "#{deck.id}. #{deck.deck_name}"
    end
    
    while updating
      puts "Which deck would you like to update? Select the id: "
      print "> "
      which_deck = gets.chomp

      if decks_array.include? decks_array[which_deck.to_i - 1]
        sleep(1)
        updating = false
        selected_deck = nil
        selected_deck_id = nil
        decks_array.each do |deck| # deck = object in decks_array
          if which_deck.to_i == deck.id.to_i
            puts
            puts "#{deck.deck_name.upcase}"
            puts "-" * 40
            puts "## " + "ID:                  |  #{deck.id}"
            puts "1. " + "Deck Name:           |  #{deck.deck_name.capitalize}"
            puts "2. " + "Topic:               |  #{deck.topic.capitalize}"  
            # puts "3. " + "Date Created:        |  #{deck.date_created}"
            # puts "4. " + "Date Modified:       |  #{deck.date_modified}"
            # puts "5. " + "No. of Cards:        |  #{deck.card_counts}"
            # puts "6. " + "No. of Tests Taken:  |  #{deck.test_counts}"
            # puts "7. " + "Familiarity:         |  #{deck.familiarity_rate}"
            puts "-" * 40
            selected_deck = deck
            # selected_deck_id = deck.id.to_i + 1
          end
        end
      else
        sleep(1)
        puts "Deck id #{which_deck} does not exist! Please enter the correct id: "
        sleep(1)
      end
    end

    select_field_to_update(decks_array, selected_deck)
    update_csv(decks_array) 
    sleep(1)
    puts
    puts "\"#{selected_deck.deck_name.capitalize}\" deck has been successfully updated!"
    # p selected_deck
    # p decks_array --> does not update in View Deck because has not been pushed to csv
end


def select_field_to_update(decks_array, selected_deck)
  
  puts "What would you like to update (note that id is not editable)?"
  sleep(1)
  puts "Select one of the numbers: "
  print "> "
  selected_field = gets.chomp.to_i
  case selected_field
    when 1
      sleep(1)
      puts "Enter new name: "
      print "> "
      new_deck_name = gets.chomp
      selected_deck.deck_name = new_deck_name
    when 2 
      sleep(1)
      puts "Enter new topic name: "
      print "> "
      new_topic_name = gets.chomp
      selected_deck.topic = new_topic_name
    else
      exit 
  end

end      

def del_deck(decks_array)
  deleting = true 
  deck_name_to_del = nil 
  selected_deck = nil
    while deleting == true
      puts "-" * 30
      puts "ID Deck Name"
      puts "-" * 30
      sleep(1)
      decks_array.each do |deck|
        puts "#{deck.id}. #{deck.deck_name}"
      end
      puts "Which deck would you like to delete? Please enter deck id: "
      print "> "
      sleep(1)
      deck_to_del = gets.chomp # deck id

      if decks_array.include? decks_array[deck_to_del.to_i - 1] 
        deleting = false
        while true
          puts "Are you sure you want to delete #{deck_name_to_del}? Y/N"
          user_confirmation = gets.chomp.downcase
          if user_confirmation == "y" || user_confirmation == "n"
            break
          end  
        end

        decks_array.each do |deck|
          if deck.id.to_i == deck_to_del.to_i
            deck_name_to_del = deck.deck_name # deck name
            selected_deck = deck.id.to_i - 1
            p selected_deck
          end
        end
      end
    end
    
  decks_array.delete_at(selected_deck)
  update_csv(decks_array) 
  sleep(1)
  puts
  puts "\"#{deck_name_to_del.capitalize}\" deck has been successfully deleted!"
end 

# starts up the app
decks_array = []
# read in the decks from the csv
decks = File.read("database/decks.csv") # decks is the csv file
csv = CSV.parse(decks, headers: true)
csv.each do |row|
  decks_array << Deck.new(row["id"], row["deck name"], row["topic"]) # pushing data from csv into var decks_array
end 

cards_array = []
cards = File.read("database/cards.csv")
csv = CSV.parse(cards, headers: true)
csv.each do |row|
  cards_array << Card.new(row["card id"], row["deck"], row["card name"], row["description"])
end

# p decks_array

while true
  start(decks_array, cards_array)
  puts "LOADING...."
  sleep(2)
  puts "Taking you back to the main menu :)"
  sleep(1)
end 


