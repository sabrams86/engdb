class RequestMailer < ActionMailer::Base
  default from: "notices@wilfley.com"

  def notify_a7(request, message)
    @request = request
    @message = message
    @email = EmailList.where(department: "A7").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification', template_name: 'eng_notify'
  end
  
end