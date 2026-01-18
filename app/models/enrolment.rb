class Enrolment < ApplicationRecord
  validates :name, presence: { message: "can't be blank" }
  validates :email, presence: { message: "can't be blank" }, 
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "is invalid" }
  validates :age_of_child, presence: { message: "can't be blank" },
                           numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 100, message: "must be a valid age between 1 and 100" }
  validate :prevent_duplicate_submission

  def send_enrolment_interest_email
    MalvernMailer.with(enrolment: self).register_interest_email.deliver_later
  end

  private

  def prevent_duplicate_submission
    return if email.blank?
    
    # Check for submissions with the same email within the last 24 hours
    recent_submission = Enrolment.where(email: email)
                                 .where("created_at > ?", 24.hours.ago)
                                 .where.not(id: id)
                                 .exists?
    
    if recent_submission
      errors.add(:email, "has already submitted an application recently. Please wait 24 hours before submitting again.")
    end
  end
end
