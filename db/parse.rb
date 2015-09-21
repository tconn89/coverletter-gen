require 'net/http'
require 'sanitize'
	def getDeckName src
		titleIndex = src.index(/title/i)
		title = /<title>/
		titleEnd = '</title>'
		deckTitle = src[/#{title}(.*?)#{titleEnd}/m, 1]
		deckTitle.slice!( / - Deck - Hearthstone/ )
		return deckTitle
	end

	def getDeckList src
		indexBegin = /<div class="deckguide-cards-options">/
		indexEnd = /<div class="graph-statistics">/
		deckList = src[/#{indexBegin}(.*?)#{indexEnd}/m, 1]
		deckArray = []
		begin 
			slice =	deckList.slice! deckList[/<li>(.*?)<\/li>/m,0]
			cleanSlice = Sanitize.fragment slice
			cleanSlice.strip!
			deckArray.push(cleanSlice)
		end while deckList[/<li>/]
		return deckArray
	end
