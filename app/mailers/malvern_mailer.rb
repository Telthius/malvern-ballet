class MalvernMailer < ApplicationMailer

  default from: "info.malvernballetschool@gmail.com"

  def register_interest_email
    @enrolment = params[:enrolment]
    mail(to: "malvernballetschool@gmail.com", subject: 'Info has been requested')
  end
end
