require_relative 'classes/Deck.rb'
require_relative 'classes/Card.rb'
require_relative 'noname.rb'

# TESTING METHODS THAT RECEIVE OBJECTS FROM CSV AND PUSH OBJECTS INTO NEW ARRAY VARIABLE

test_deck = Deck.new(1,"Test Deck", "Testing")

actual = test_deck.to_a # what the method returns
expected = [1,"Test Deck", "Testing"]

if actual == expected
  puts "CSV deck inputs --> new array var PASSED"
  else
  puts "CSV card inputs --> new array var FAILED"
  end

test_card = Card.new(1,"Test Card", "Card Name", "Some Description")

actual = test_card.to_a
expected = [1, "Test Card", "Card Name", "Some Description"]

if actual == expected
  puts "CSV card inputs --> new array var PASSED"
  else
  puts "CSV card inputs --> new array var FAILED"
  end

# TESTS FOR TERMINAL APP

# 1. Valid data type view deck






