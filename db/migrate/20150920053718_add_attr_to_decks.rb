class AddAttrToDecks < ActiveRecord::Migration
  def change
    add_column :decks, :name, :string
    add_column :decks, :role, :string
  end
end
