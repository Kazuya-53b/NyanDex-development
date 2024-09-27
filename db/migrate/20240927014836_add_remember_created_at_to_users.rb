class AddRememberCreatedAtToUsers < ActiveRecord::Migration[7.0]
  def change
    unless column_exists?(:users, :remember_created_at)
      add_column :users, :remember_created_at, :datetime
    end
  end
end
