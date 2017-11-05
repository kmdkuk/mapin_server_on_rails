class RenameHoursbeginColumnToShops < ActiveRecord::Migration[5.0]
  def change
    rename_column :shops, :hours_begin, :business_hours
  end
end
