class AddPaperclipFieldsToWishes < ActiveRecord::Migration
  def change
  	add_column :wishes, :user_id,			 :integer
  	add_column :wishes, :image_file_name,    :string
    add_column :wishes, :image_content_type, :string
    add_column :wishes, :image_file_size,    :integer
    add_column :wishes, :image_updated_at,   :datetime
  end
end
