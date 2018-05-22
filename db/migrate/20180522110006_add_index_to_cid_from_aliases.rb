class AddIndexToCidFromAliases < ActiveRecord::Migration[5.1]
  def change
    add_index :aliases, :cid
  end
end
