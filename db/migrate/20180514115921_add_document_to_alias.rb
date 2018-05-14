class AddDocumentToAlias < ActiveRecord::Migration[5.1]
  def change
    add_column :aliases, :document, :string
  end
end
