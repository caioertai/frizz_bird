class AddItemToProduct < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :item, foreign_key: true
  end
end
