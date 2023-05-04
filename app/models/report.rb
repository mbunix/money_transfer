class Report < ApplicationRecord
    def self.generate(user, days)
    transactions = user.transactions.where(created_at: (Time.zone.now - days.days)..Time.zone.now)
    ReportMailer.send_report(user, transactions).deliver_now
    end

    has_one :user
end
