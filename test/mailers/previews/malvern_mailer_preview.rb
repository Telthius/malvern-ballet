# Preview all emails at http://localhost:3000/rails/mailers/malvern_mailer
class MalvernMailerPreview < ActionMailer::Preview
  def register_interest_email
    MalvernMailer.with(enrolment: Enrolment.first).register_interest_email
  end
end
