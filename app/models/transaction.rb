class Transaction < ApplicationRecord
    def create
    @transaction = Transaction.new(transaction_params)
    @transaction.sender_id = current_user.id

    if @transaction.save
      UserMailer.transfer_confirmation_email(current_user, @transaction.receiver_id, @transaction.amount).deliver_now
      render json: @transaction, status: :created
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end
    has_one: user
end
