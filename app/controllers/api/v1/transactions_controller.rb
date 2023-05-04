class Api::V1::TransactionsController < ApplicationController
   before_action :authenticate_user!
  
  def new
    @transaction = current_user.transactions.new
  end
  def index
    @transactions = Transaction.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    render json: @transactions
  end
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
  def top_up
    # extract number and amount from params
    number = params[:number]
    amount = params[:amount].to_f
    # get the current user
    user = current_user
    
    # get the top-up amount and phone number from the request params
    amount = params[:amount]
    phone_number = params[:phone_number]
    
    # perform top-up using Mpesa API
    mpesa = Mpesa::API.new
    response = mpesa.topup(phone_number, amount)
    
    # check if top-up was successful
    if response.success?
      # update user balance
      user.balance += amount.to_f
      user.save
      
      # return success response
      render json: { message: "Top-up successful", balance: user.balance }
    else
      # return error response
      render json: { message: "Top-up failed: #{response.error_message}" }, status: :unprocessable_entity
    end
  end
  
  private

  def transaction_params
    params.require(:transaction).permit(:receiver_id, :amount)
  end
end
