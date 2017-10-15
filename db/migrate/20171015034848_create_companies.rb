class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :name_kana
      t.string :location
      t.string :location_kana
      t.string :responsible_person
      t.string :responsible_person_kana
      t.string :email
      t.string :phonenumber

      t.timestamps
    end
  end
end
