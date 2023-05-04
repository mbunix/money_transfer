class RenameConfirmationTockenToUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :confirmation_tocken, :confirmation_token
  end
end
