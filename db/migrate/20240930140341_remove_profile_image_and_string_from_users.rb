class RemoveProfileImageAndStringFromUsers < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :profile_image, :string
    remove_column :users, :string, :string
  end
end
