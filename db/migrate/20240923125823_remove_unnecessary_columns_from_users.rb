class RemoveUnnecessaryColumnsFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :salt, :string
    remove_column :users, :reset_password_token_expires_at, :datetime
    remove_column :users, :remember_me_token, :string
    remove_column :users, :remember_me_token_expires_at, :datetime
    remove_column :users, :password_digest, :string
  end
end
