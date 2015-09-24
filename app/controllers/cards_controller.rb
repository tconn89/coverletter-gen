class CardsController < ApplicationController


	def index
		term = params[:term]
		if term.length > 2
			while term =~ /(.*),/
				term.slice!(/(.*),/)
			end
			@cards = Card.order(:name).where("name LIKE ?", "#{term}%")
			render json: @cards.map(&:name)
		end
	end

  def new
  	puts 'hello'
  end

  def show
  	deck = Deck.find(params[:id])

  	@list = deck.getCards
  end

  def query
		if params[:search]
			criteria = params[:search].split(', ')
			puts criteria
			criteria.each_with_index do |card_name,i|
				c = Card.find_by(name: card_name)	
				if(i == 0) 
					@decks = c.what_decks
				else
					#filter an array of decks by card record c
					@decks.delete_if {|deck| !deck.has?(c)}
				end
			end
		else
			@decks = false
		end
	end
end

