class MalvernMailer < ApplicationMailer

  default from: "info.malvernballetschool@gmail.com"

  def register_interest_email
    @enrolment = params[:enrolment]
    mail(to: @enrolment.email, subject: 'Mail tester')
  end
end
