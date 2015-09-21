class Card < ActiveRecord::Base
	has_many :bridges
	has_many :decks, :through => :bridges
	validates :name, uniqueness: { case_sensitive: false }

	def self.decks_contained_in(c_query)
		b = Bridge.where(card_id:c_query.id)
		deck_ids = []
		b.each do |relational_item|
			deck_ids.push(relational_item.deck_id)
		end
		deck_list = []
		deck_ids.each do |id|
			deck_list.push(Deck.find(id).name)
		end
		return deck_list
	end

end
