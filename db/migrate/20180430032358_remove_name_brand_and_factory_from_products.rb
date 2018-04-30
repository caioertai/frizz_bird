class RemoveNameBrandAndFactoryFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :name
    remove_column :products, :brand
    remove_column :products, :factory
  end
end
