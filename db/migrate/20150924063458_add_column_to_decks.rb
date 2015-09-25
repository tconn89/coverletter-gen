class AddColumnToDecks < ActiveRecord::Migration
  def change
    add_column :decks, :hearthhead_id, :string
  end
end
