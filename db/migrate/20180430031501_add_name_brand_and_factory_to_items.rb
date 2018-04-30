class AddNameBrandAndFactoryToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :name, :string
    add_column :items, :brand, :string
    add_column :items, :factory, :string
  end
end
