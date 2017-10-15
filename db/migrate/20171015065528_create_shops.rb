class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.string :image
      t.string :address
      t.string :hours_begin
      t.string :hours_end
      t.string :tel
      t.string :postal_code
      t.string :homepage

      t.timestamps
    end
  end
end
