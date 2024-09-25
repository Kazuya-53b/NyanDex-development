class RemoveUnnecessaryColumnsFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :salt, :string if column_exists?(:users, :salt)
    remove_column :users, :reset_password_token_expires_at, :datetime if column_exists?(:users, :reset_password_token_expires_at)
    remove_column :users, :remember_me_token, :string if column_exists?(:users, :remember_me_token)
    remove_column :users, :remember_me_token_expires_at, :datetime if column_exists?(:users, :remember_me_token_expires_at)
    remove_column :users, :password_digest, :string if column_exists?(:users, :password_digest)
  end
end
