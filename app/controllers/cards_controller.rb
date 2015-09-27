class CardsController < ApplicationController

	# root page input logic
	def index
		term = params[:term]
		while term =~ /(.*),/
			term.slice!(/(.*),/)
		end
		term.strip!
		term.capitalize!
		puts term
		if term.length > 2
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

  # search database for matching decks
  def query
		if params[:search]
			criteria = params[:search].split(',')
			criteria.each_with_index do |criterium,i|
				criterium.sub! /,/, ''
				criterium.strip!
				criterium = criterium.split.map(&:capitalize).join(' ')
			end
			criteria.delete_if {|i| i.empty?}
			criteria.each_with_index do |card_name,i|
				c = Card.find_by(name: card_name)	
				if !c
					@decks = 'NO RESULTS'
					return
				end
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

