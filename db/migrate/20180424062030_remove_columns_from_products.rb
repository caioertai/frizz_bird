class RemoveColumnsFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :path
    remove_column :products, :document
  end
end
