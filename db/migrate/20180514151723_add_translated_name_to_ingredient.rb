class AddTranslatedNameToIngredient < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients, :translated_name, :string
  end
end
