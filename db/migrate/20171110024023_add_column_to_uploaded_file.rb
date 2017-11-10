class AddColumnToUploadedFile < ActiveRecord::Migration[5.0]
  def change
    add_column :uploaded_files, :file, :string
  end
end
