class AddColumnToBridges < ActiveRecord::Migration
  def change
  	add_column :bridges, :duplicate, :boolean
  end
end
