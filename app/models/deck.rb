class Deck < ActiveRecord::Base
	has_many :bridges
	has_many :decks, :through => :bridges

	def getCards
		list = Bridge.where(deck_id:self.id)
		names = []
		list.each do |bridge|

			card = Card.find(bridge.card_id)
			if bridge.duplicate
				card.name = card.name + ' x2'
			end
			names.push(card.name)
		end
		return names
	end

	def has? card_record
		Bridge.exists?(deck_id:self.id,card_id:card_record.id)
	end
end
