class AddPathToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :path, :string
  end
end
