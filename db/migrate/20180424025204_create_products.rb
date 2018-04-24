class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :ean
      t.string :path
      t.string :factory
      t.string :brand
      t.string :document

      t.timestamps
    end
  end
end
