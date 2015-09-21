require 'net/http'
require 'sanitize'
	$source = Net::HTTP.get('www.hearthhead.com','/deck=100081')
	def deckName src
		titleIndex = src.index(/title/i)
		title = /<title>/
		titleEnd = '</title>'
		deckTitle = src[/#{title}(.*?)#{titleEnd}/m, 1]
		return deckTitle
	end

	def getDeckList src
		name = deckName src
		if name =~ /Error/ 
			return 'no deck here'
		else
			puts name
		end 
		indexBegin = /<div class="deckguide-cards-options">/
		indexEnd = /<div class="graph-statistics">/
		deckList = src[/#{indexBegin}(.*?)#{indexEnd}/m, 1]
		deckArray = []
		begin 
			slice =	deckList.slice! deckList[/<li>(.*?)<\/li>/m,0]
			cleanSlice = Sanitize.fragment slice
			deckArray.push(cleanSlice)
		end while deckList[/<li>/]
		return deckArray
	end


puts deckList $source	