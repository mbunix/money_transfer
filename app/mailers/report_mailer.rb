class ReportMailer < ApplicationMailer
  def summary(user, transactions, days)
    @user = user
    @transactions = transactions
    @days = days

    mail(to: @user.email, subject: "Transaction Summary for the last #{@days} days")
  end
end
