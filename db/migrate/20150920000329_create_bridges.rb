class CreateBridges < ActiveRecord::Migration
  def change
    create_table :bridges do |t|
      t.belongs_to :deck, index: true
      t.belongs_to :card, index: true
      # bridge between decks and cards
      t.timestamps null: false
    end
  end
end
