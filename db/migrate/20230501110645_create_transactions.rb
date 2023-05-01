class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.float :amount

      t.timestamps
    end
  end
end
