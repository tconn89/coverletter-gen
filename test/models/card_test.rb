require 'test_helper'

class CardTest < ActiveSupport::TestCase

	test "Ogre Brute random sample existence" do
		c1 = Card.find_by(name:'Ogre Brute')
		assert c1, 'Ogre Brute does not exist'
		puts Card.find(171)
	end

  test "card should be unique" do
  	duplicate_card = @card.dup
  	@card.save
  	assert_not duplicate_card.valid?
  end
  test "card.what_decks should return all relevant decks" do
  	add_bridges(@card, @decks)	
  	assert @card.what_decks & @decks == @decks
  end

end
