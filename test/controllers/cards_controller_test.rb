require 'test_helper'

class CardsControllerTest < ActionController::TestCase

  test "should get new" do
    get :new
    assert_response :success
  end

  # Should return a few decks including "Silence your minions priest"
  test "query should split string" do
  	get :query, :search => "Ogre Brute,Ironbeak Owl"
  	c1 = Card.find_by(name:'Ogre Brute')
  	c2 = Card.find_by(name:'Ironbeak Owl')
  	assert c1, 'Could not find Ogre Brute'
  	assert c2, 'Could not find Ironbeak Owl'
  	debugger
  	:decks.each do |deck|
  		assert deck.has? c1, 'deck does not have Ogre Brute'
  		assert deck.has? c2, 'deck does not have Ironbeak Owl'
  	end


  end
end
