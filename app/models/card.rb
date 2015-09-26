class Card < ActiveRecord::Base
	has_many :bridges
	has_many :decks, :through => :bridges
	validates :name, presence: true
	validates :name, uniqueness: { case_sensitive: false }
	# Takes input card record and outputs list of deck records
	def what_decks
		b = Bridge.where(card_id:self.id)
		deck_ids = []
		b.each do |bridge|
			deck_ids.push(bridge.deck_id)
		end
		deck_list = []
		deck_ids.each do |id|
			deck_list.push(Deck.find(id))
		end
		return deck_list
	end

end
