class AddSearchedAtToIngredient < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients, :searched_at, :datetime
  end
end
