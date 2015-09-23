# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require_relative 'parse'

def page num
	tail = "/deck=#{num}"
	source = Net::HTTP.get('www.hearthhead.com',tail)
	return source
end

def data_input src
	deckName = getDeckName src
	if deckName =~ /Error/ 
		return false
	else
		begin
		d = Deck.create(name:deckName, role:"Priest")
		rescue Encoding::UndefinedConversionError => e
			puts deckName
			return false
		end
		list = getDeckList src
		
		list.each do |c|
			dup = false
			if c =~ /x2/ 
				dup = true
				c.slice! ' x2'
			end

			c = Card.create(name:c)
			if !c.id
				c = Card.find_by(name:c.name)
			end
			Bridge.create(deck_id:d.id,card_id:c.id,duplicate:dup)
		end
	end 
	return true
end

# collected 121k to 123k so far
x = 122000
count = 0
while x < 123000 
	if data_input(page(x))
		count += 1
		puts x
	end
	x += 1
end