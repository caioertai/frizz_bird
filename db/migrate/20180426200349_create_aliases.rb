class CreateAliases < ActiveRecord::Migration[5.1]
  def change
    create_table :aliases do |t|
      t.string :name

      t.timestamps
    end
  end
end
