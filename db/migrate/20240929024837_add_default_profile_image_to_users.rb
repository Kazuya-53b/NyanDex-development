class AddDefaultProfileImageToUsers < ActiveRecord::Migration[7.2]
  def change
    change_column_default :users, :profile_image, 'https://example.com/default_image.png'
  end
end
