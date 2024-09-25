class ChangeUsersTableForDevise < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :password_digest, :string
    add_column :users, :encrypted_password, :string
  end
end
