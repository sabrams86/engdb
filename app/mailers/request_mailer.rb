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
    @email = EmailList.where(department: "Manufacturing").all
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
    @email = EmailList.where(department: "A7" && "A7_Backup").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_a9(request, message, subject)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "A9" && "A9_Backup").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_ag(request, message, subject)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "AG" && "AG_Backup").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_af(request, message, subject)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "AF" && "AF_Backup").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_s3(request, message, subject)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "S3" && "S3_Backup").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_legacy(request, message, subject)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "Legacy" && "Legacy_Backup").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_kkpro(request, message, subject)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "K/Kpro" && "K_Backup").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_emw(request, message, subject)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "EMW" && "EMW_Backup").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_hd(request, message, subject)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "HD" && "HD_Backup").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_nm(request, message, subject)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "Non-Metallic"&& "NM_Backup").all
    to = []
    @email.each do |e|
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