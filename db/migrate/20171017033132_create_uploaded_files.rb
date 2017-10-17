class CreateUploadedFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :uploaded_files do |t|
      t.string :name
      t.string :url
      t.string :file_type
      t.integer :shop_id

      t.timestamps
    end
  end
end
