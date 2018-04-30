class DropIngredientsAliases < ActiveRecord::Migration[5.1]
  def change
    drop_table :ingredients_aliases
  end
end
