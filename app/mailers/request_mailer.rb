class RequestMailer < ActionMailer::Base
  default from: "notices@wilfley.com"

  def notify_eng(request, message)
    @request = request
    @message = message
    @email = EmailList.where(department: "Engineering").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification', template_name: 'eng_notify'
  end
  
  def notify_mfg(request, message)
    @request = request
    @message = message
    @email = EmailList.where(department: "Manufacturing").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification', template_name: 'eng_notify'
  end
  
  def notify_acct(request, message)
    @request = request
    @message = message
    @email = EmailList.where(department: "Accounting").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification', template_name: 'eng_notify'
  end

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
  
  def notify_a9(request, message)
    @request = request
    @message = message
    @email = EmailList.where(department: "A9").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification', template_name: 'eng_notify'
  end
  
  def notify_ag(request, message)
    @request = request
    @message = message
    @email = EmailList.where(department: "AG").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification', template_name: 'eng_notify'
  end
  
  def notify_af(request, message)
    @request = request
    @message = message
    @email = EmailList.where(department: "AF").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification', template_name: 'eng_notify'
  end
  
  def notify_s3(request, message)
    @request = request
    @message = message
    @email = EmailList.where(department: "S3").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification', template_name: 'eng_notify'
  end
  
  def notify_legacy(request, message)
    @request = request
    @message = message
    @email = EmailList.where(department: "Legacy").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification', template_name: 'eng_notify'
  end
  
  def notify_kkpro(request, message)
    @request = request
    @message = message
    @email = EmailList.where(department: "K/Kpro").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification', template_name: 'eng_notify'
  end
  
  def notify_emw(request, message)
    @request = request
    @message = message
    @email = EmailList.where(department: "EMW").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification', template_name: 'eng_notify'
  end
  
  def notify_hd(request, message)
    @request = request
    @message = message
    @email = EmailList.where(department: "HD").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification', template_name: 'eng_notify'
  end
  
  def notify_nm(request, message)
    @request = request
    @message = message
    @email = EmailList.where(department: "Non-Metallic").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification', template_name: 'eng_notify'
  end
  
end