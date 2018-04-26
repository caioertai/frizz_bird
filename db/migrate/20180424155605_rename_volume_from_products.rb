class RenameVolumeFromProducts < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :volume, :presentation
  end
end
