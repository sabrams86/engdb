class RequestMailer < ActionMailer::Base
  default from: "notices@wilfley.com"

  def submit_additional(request, message, additionalemails, subject)
    @request = request
    @message = message
    @emails = additionalemails
    @subject = subject
    to = []
    to << @emails
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  def notify_eng(request, message, subject)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "Engineering").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_mfg(request, message, subject)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "Manufacturing_SIR").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_acct(request, message, subject)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "Accounting").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end

  def notify_a7(request, message, subject)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "A7")
    @backup = EmailList.where(department: "A7_Backup")
    to = []
    @email.each do |e|
      to.push e.email
    end
    @backup.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_a9(request, message, subject)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "A9")
    @backup = EmailList.where(department: "A9_Backup")
    to = []
    @email.each do |e|
      to.push e.email
    end
    @backup.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_ag(request, message, subject)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "AG")
    @backup = EmailList.where(department: "AG_Backup")
    to = []
    @email.each do |e|
      to.push e.email
    end
    @backup.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_af(request, message, subject)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "AF")
    @backup = EmailList.where(department: "AF_Backup")
    to = []
    @email.each do |e|
      to.push e.email
    end
    @backup.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_s3(request, message, subject)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "S3")
    @backup = EmailList.where(department: "S3_Backup")
    to = []
    @email.each do |e|
      to.push e.email
    end
    @backup.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_legacy(request, message, subject)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "Legacy")
    @backup = EmailList.where(department: "Legacy_Backup")
    to = []
    @email.each do |e|
      to.push e.email
    end
    @backup.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_kkpro(request, message, subject)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "K/Kpro")
    @backup = EmailList.where(department: "K_Backup")
    to = []
    @email.each do |e|
      to.push e.email
    end
    @backup.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_emw(request, message, subject)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "EMW")
    @backup = EmailList.where(department: "EMW_Backup")
    to = []
    @email.each do |e|
      to.push e.email
    end
    @backup.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_hd(request, message, subject)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "HD")
    @backup = EmailList.where(department: "HD_Backup")
    to = []
    @email.each do |e|
      to.push e.email
    end
    @backup.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_nm(request, message, subject)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "Non-Metallic")
    @backup = EmailList.where(department: "NM_Backup")
    to = []
    @email.each do |e|
      to.push e.email
    end
    @backup.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_sales(request, message, subject)
    @request = request
    @message = message
    @subject = subject
    @email = User.where(name: @request.requester).where(name: @request.regional_sales_mgr).all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' Final Report'+'  '+@subject, template_name: 'eng_notify'  
  end
  
  def reject(request, message, subject)
    @request = request
    @message = message
    @subject = subject
    @email = User.where(name: @request.requester).all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' Incomplete'+'  '+@subject, template_name: 'eng_notify'  
  end
  def reject_additional(request, message, additionalemails, subject)
    @request = request
    @message = message
    @emails = additionalemails
    @subject = subject
    to = []
    to << @emails
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' Incomplete'+'  '+@subject, template_name: 'eng_notify'
  end
  
end