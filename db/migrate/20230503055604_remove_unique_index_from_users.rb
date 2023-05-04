class RemoveUniqueIndexFromUsers < ActiveRecord::Migration[7.0]
 def change
    remove_index :users, :confirmation_token
     remove_index :users, :index_users_on_uid_and_provider
  end
end
