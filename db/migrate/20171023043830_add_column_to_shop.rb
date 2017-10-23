class AddColumnToShop < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :longitude, :double
    add_column :shops, :latitude, :double
  end
end
