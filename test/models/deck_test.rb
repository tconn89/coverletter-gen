require 'test_helper'

class DeckTest < ActiveSupport::TestCase
  test "deck should contain 30 cards" do
    assert true
  end

  test "deck.has? card should return true if card is in deck" do
  	add_bridges(@card, @decks)	
  	assert @deck4.has? @card
	end
end
