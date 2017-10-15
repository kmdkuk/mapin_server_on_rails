class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.integer :company_id
      t.string :image_url
      t.string :location
      t.string :businesshours
      t.string :phonenumber

      t.timestamps
    end
  end
end
