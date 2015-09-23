ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

	def setup
		@card = Card.new(name: 'example card')
		@deck1 = Deck.new(name: 'example_deck', role: 'Shaman')
		@deck2 = Deck.new(name: 'example_deck1', role: 'Warlock')
		@deck3 = Deck.new(name: 'example_deck2', role: 'Priest')
		@deck4 = Deck.new(name: 'example_deck2', role: 'Priest')
		@decks = [@deck1,@deck2,@deck3,@deck4]
		@decks.each do |deck|
			deck.save
		end
	end

	def add_bridges card, decks
		c = card.save
		decks.each do |deck|
			Bridge.create(deck_id:deck.id, card_id:card.id)
		end
	end

	setup
  # Add more helper methods to be used by all tests here...
end
