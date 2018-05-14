class AddSynonymsToAlias < ActiveRecord::Migration[5.1]
  def change
    add_column :aliases, :synonyms, :string
  end
end
