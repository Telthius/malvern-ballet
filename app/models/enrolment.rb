class Enrolment < ApplicationRecord
  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  # validate :ensure_email_unique

  def send_enrolment_interest_email
    MalvernMailer.with(enrolment: self).register_interest_email.deliver_later
  end

  private

    def ensure_email_unique
      puts email
      errors.add(:email, "has already registered interest") unless Enrolment.where(email:).empty?
      true
    end
end
