class UserMailer < ApplicationMailer
  def transfer_confirmation_email(sender, receiver_id, amount)
    @sender = sender
    @receiver = User.find(receiver_id)
    @amount = amount

    mail(to: @receiver.email, subject: "Transfer Confirmation
