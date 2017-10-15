class CreateUploadedFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :uploaded_files do |t|
      t.integer :shop_id
      t.string :file_url

      t.timestamps
    end
  end
end
