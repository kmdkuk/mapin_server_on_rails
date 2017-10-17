class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :image_url
      t.string :postal_code
      t.string :address
      t.string :tel
      t.string :hours_begin
      t.string :hours_end
      t.integer :category_id
      t.string :homepage
      t.integer :company_id

      t.timestamps
    end
  end
end
