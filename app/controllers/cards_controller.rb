class CardsController < ApplicationController
  def new
  	puts 'hello'
  end
  def show
  	deck = Deck.find(params[:id])

  	@list = deck.getCards
  end
  def index
  	if params[:search]
  		puts params[:search]
  		c = Card.find_by(name: params[:search])
  		puts !!c
  		@decks = Card.decks_contained_in(c)
  	else
  		@decks = false
  	end
  end
end
