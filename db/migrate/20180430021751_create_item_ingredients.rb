class CreateItemIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :item_ingredients do |t|
      t.references :item, foreign_key: true
      t.references :ingredient, foreign_key: true

      t.timestamps
    end
  end
end
