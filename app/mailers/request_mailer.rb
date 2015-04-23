class RequestMailer < ActionMailer::Base
  default from: "notices@wilfley.com"

  def submit_additional(request, message, additionalemails, subject, file)
    @request = request
    @message = message
    @emails = additionalemails
    @subject = subject
    to = []
    to << @emails
      attachments[file.original_filename] = file.read() unless file.blank?
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_eng(request, message, subject, file)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "Engineering_SIR").all
    @cc = User.where(name: @request.requester)
    @cc2 = User.where(name: @request.regional_sales_mgr)
    cc = []
    @cc.each do |e|
      cc.push e.email
    end
    @cc2.each do |e|
      cc.push e.email
    end
    to = []
    @email.each do |e|
      to.push e.email
    end
      attachments[file.original_filename] = file.read() unless file.blank?
    mail to: to, cc: cc, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_mfg(request, message, subject, file)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "Manufacturing_SIR").all
    @cc = EmailList.where(department: @request.product_line).all
    cc = []
    @cc.each do |e|
      cc.push e.email
    end
    to = []
    @email.each do |e|
      to.push e.email
    end
    attachments[file.original_filename] = file.read() unless file.blank?
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_acct(request, message, subject, file)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "Accounting").all
    @cc = Emaillist.where(department: "Manufacturing_SIR").all
    cc = []
    @cc.each do |e|
      cc.push e.email
    end
    to = []
    @email.each do |e|
      to.push e.email
    end
    attachments[file.original_filename] = file.read() unless file.blank?
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end

  def notify_a7(request, message, subject, file)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "A7")
    @backup = EmailList.where(department: "A7_Backup")
    @cc = User.where(name: @request.requester)
    @cc2 = User.where(name: @request.regional_sales_mgr)
    cc = []
    @cc.each do |e|
      cc.push e.email
    end
    @cc2.each do |e|
      cc.push e.email
    end
    to = []
    @email.each do |e|
      to.push e.email
    end
    @backup.each do |e|
      to.push e.email
    end
    attachments[file.original_filename] = file.read() unless file.blank?
    mail to: to, cc: cc, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_a9(request, message, subject, file)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "A9")
    @backup = EmailList.where(department: "A9_Backup")
    @cc = User.where(name: @request.requester)
    @cc2 = User.where(name: @request.regional_sales_mgr)
    cc = []
    @cc.each do |e|
      cc.push e.email
    end
    @cc2.each do |e|
      cc.push e.email
    end
    to = []
    @email.each do |e|
      to.push e.email
    end
    @backup.each do |e|
      to.push e.email
    end
    attachments[file.original_filename] = file.read() unless file.blank?
    mail to: to, cc: cc, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_ag(request, message, subject, file)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "AG")
    @backup = EmailList.where(department: "AG_Backup")
    @cc = User.where(name: @request.requester)
    @cc2 = User.where(name: @request.regional_sales_mgr)
    cc = []
    @cc.each do |e|
      cc.push e.email
    end
    @cc2.each do |e|
      cc.push e.email
    end
    to = []
    @email.each do |e|
      to.push e.email
    end
    @backup.each do |e|
      to.push e.email
    end
    attachments[file.original_filename] = file.read() unless file.blank?
    mail to: to, cc: cc, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_af(request, message, subject, file)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "AF")
    @backup = EmailList.where(department: "AF_Backup")
    @cc = User.where(name: @request.requester)
    @cc2 = User.where(name: @request.regional_sales_mgr)
    cc = []
    @cc.each do |e|
      cc.push e.email
    end
    @cc2.each do |e|
      cc.push e.email
    end
    to = []
    @email.each do |e|
      to.push e.email
    end
    @backup.each do |e|
      to.push e.email
    end
    attachments[file.original_filename] = file.read() unless file.blank?
    mail to: to, cc: cc, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_s3(request, message, subject, file)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "S3")
    @backup = EmailList.where(department: "S3_Backup")
    @cc = User.where(name: @request.requester)
    @cc2 = User.where(name: @request.regional_sales_mgr)
    cc = []
    @cc.each do |e|
      cc.push e.email
    end
    @cc2.each do |e|
      cc.push e.email
    end
    to = []
    @email.each do |e|
      to.push e.email
    end
    @backup.each do |e|
      to.push e.email
    end
    attachments[file.original_filename] = file.read() unless file.blank?
    mail to: to, cc: cc, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_legacy(request, message, subject, file)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "Legacy")
    @backup = EmailList.where(department: "Legacy_Backup")
    @cc = User.where(name: @request.requester)
    @cc2 = User.where(name: @request.regional_sales_mgr)
    cc = []
    @cc.each do |e|
      cc.push e.email
    end
    @cc2.each do |e|
      cc.push e.email
    end
    to = []
    @email.each do |e|
      to.push e.email
    end
    @backup.each do |e|
      to.push e.email
    end
    attachments[file.original_filename] = file.read() unless file.blank?
    mail to: to, cc: cc, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_kkpro(request, message, subject, file)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "K/Kpro")
    @backup = EmailList.where(department: "K_Backup")
    @cc = User.where(name: @request.requester)
    @cc2 = User.where(name: @request.regional_sales_mgr)
    cc = []
    @cc.each do |e|
      cc.push e.email
    end
    @cc2.each do |e|
      cc.push e.email
    end
    to = []
    @email.each do |e|
      to.push e.email
    end
    @backup.each do |e|
      to.push e.email
    end
    attachments[file.original_filename] = file.read() unless file.blank?
    mail to: to, cc: cc, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_emw(request, message, subject, file)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "EMW")
    @backup = EmailList.where(department: "EMW_Backup")
    @cc = User.where(name: @request.requester)
    @cc2 = User.where(name: @request.regional_sales_mgr)
    cc = []
    @cc.each do |e|
      cc.push e.email
    end
    @cc2.each do |e|
      cc.push e.email
    end
    to = []
    @email.each do |e|
      to.push e.email
    end
    @backup.each do |e|
      to.push e.email
    end
      attachments[file.original_filename] = file.read() unless file.blank?
    mail to: to, cc: cc, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_hd(request, message, subject, file)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "HD")
    @backup = EmailList.where(department: "HD_Backup")
    @cc = User.where(name: @request.requester)
    @cc2 = User.where(name: @request.regional_sales_mgr)
    cc = []
    @cc.each do |e|
      cc.push e.email
    end
    @cc2.each do |e|
      cc.push e.email
    end
    to = []
    @email.each do |e|
      to.push e.email
    end
    @backup.each do |e|
      to.push e.email
    end
    attachments[file.original_filename] = file.read() unless file.blank?
    mail to: to, cc: cc, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_nm(request, message, subject, file)
    @request = request
    @message = message
    @subject = subject
    @email = EmailList.where(department: "Non-Metallic")
    @backup = EmailList.where(department: "NM_Backup")
    @cc = User.where(name: @request.requester)
    @cc2 = User.where(name: @request.regional_sales_mgr)
    cc = []
    @cc.each do |e|
      cc.push e.email
    end
    @cc2.each do |e|
      cc.push e.email
    end
    to = []
    @email.each do |e|
      to.push e.email
    end
    @backup.each do |e|
      to.push e.email
    end
    attachments[file.original_filename] = file.read() unless file.blank?
    mail to: to, cc: cc, subject: 'SIR '+@request.request_number.to_s+' notification'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def notify_sales(request, message, subject, file)
    @request = request
    @message = message
    @subject = subject
    @email1 = User.where(name: @request.requester).all
    @email2 = User.where(name: @request.regional_sales_mgr).all
    @cc = User.where(department: "Accounting").all
    cc = []
    @cc.each do |e|
      cc.push e.email
    end
    to = []
    @email1.each do |e|
      to.push e.email
    end
    @email2.each do |e|
      to.push e.email
    end
    attachments[file.original_filename] = file.read() unless file.blank?
    mail to: to, cc: cc, subject: 'SIR '+@request.request_number.to_s+' Final Report'+'  '+@subject, template_name: 'eng_notify'  
  end
  
  def reject(request, message, subject, file)
    @request = request
    @message = message
    @subject = subject
    @email = User.where(name: @request.requester).all
    @email2 = User.where(name: @request.regional_sales_mgr).all
    @cc = EmailList.where(department: @request.product_line).all
    cc = []
    @cc.each do |e|
      cc.push e.email
    end    
    to = []
    @email.each do |e|
      to.push e.email
    end
    @email2.each do |e|
      to.push e.email
    end
    attachments[file.original_filename] = file.read() unless file.blank?
    mail to: to, cc: cc, subject: 'SIR '+@request.request_number.to_s+' Incomplete'+'  '+@subject, template_name: 'eng_notify'  
  end
  
  def reject_additional(request, message, additionalemails, subject, file)
    @request = request
    @message = message
    @emails = additionalemails
    @subject = subject
    to = []
    to << @emails
    attachments[file.original_filename] = file.read() unless file.blank?
    mail to: to, subject: 'SIR '+@request.request_number.to_s+' Incomplete'+'  '+@subject, template_name: 'eng_notify'
  end
  
  def close(request, message, subject, file)
    @request = request
    @message = message
    @subject = subject
    @email = User.where(name: @request.requester).all
    @email2 = User.where(name: @request.regional_sales_mgr).all
    @cc = EmailList.where(department: @request.product_line).all
    cc = []
    @cc.each do |e|
      cc.push e.email
    end    
    to = []
    @email.each do |e|
      to.push e.email
    end
    @email2.each do |e|
      to.push e.email
    end
    attachments[file.original_filename] = file.read() unless file.blank?
    mail to: to, cc: cc, subject: 'SIR '+@request.request_number.to_s+' Complete'+'  '+@subject, template_name: 'eng_notify'  
  end
end