class AddAliasToIngredients < ActiveRecord::Migration[5.1]
  def change
    add_reference :ingredients, :alias, foreign_key: true
  end
end
