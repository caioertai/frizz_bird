class RenameSynonymsFromAliases < ActiveRecord::Migration[5.1]
  def change
    rename_column :aliases, :synonyms, :cid
  end
end
