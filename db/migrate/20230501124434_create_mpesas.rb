class CreateMpesas < ActiveRecord::Migration[7.0]
  def change
    create_table :mpesas do |t|
      t.string :phoneNumber
      t.float :amount
      t.string :checkoutRequestID
      t.string :merchantRequestID
      t.string :mpesaReceiptNumber

      t.timestamps
    end
  end
end
