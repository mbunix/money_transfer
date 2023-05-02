class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      ## Devise columns
  t.string :email,              null: false, default: ""
  t.string :encrypted_password, null: false, default: ""
  t.string :reset_password_token
  t.datetime :reset_password_sent_at
  t.datetime :remember_created_at
  t.integer :sign_in_count, default: 0, null: false
  t.datetime :current_sign_in_at
  t.datetime :last_sign_in_at
  t.string :current_sign_in_ip
  t.string :last_sign_in_ip
  t.string :confirmation_token
  t.datetime :confirmed_at
  t.datetime :confirmation_sent_at
  t.string :unconfirmed_email # Only if using reconfirmable
  t.string :provider, null: false, default: "email"
  t.string :uid, null: false, default: ""
  #own columns
      t.string :name
      t.string :email
      t.string :password_digest
      t.float :balance

      t.timestamps
    end
  end
end
