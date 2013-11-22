class EcnNotifier < ActionMailer::Base
  default from: "engineering_notices@wilfley.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ecn_notifier.closed.subject
  #
  #------------------------------------------------#
  #The following methods are for submit ecn emails #
  def submit_engineering(ecn, message)
    @ecn = ecn
    @message = message
    @email = EmailList.where(department: "Engineering").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'ECN '+@ecn.ecn_number.to_s+' approval', template_name: 'submitted'
  end
  
  def submit_purchasing(ecn, message)
    @ecn = ecn
    @message = message
    @email = EmailList.where(department: "Purchasing").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'ECN '+@ecn.ecn_number.to_s+' approval', template_name: 'submitted'
  end
  
  def submit_planning(ecn, message)
    @ecn = ecn
    @message = message
    @email = EmailList.where(department: "Planning").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'ECN '+@ecn.ecn_number.to_s+' approval', template_name: 'submitted'
  end
  
  def submit_manufacturing(ecn, message)
    @ecn = ecn
    @message = message
    @email = EmailList.where(department: "Manufacturing").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'ECN '+@ecn.ecn_number.to_s+' approval', template_name: 'submitted'
  end
    
  def submit_qantel(ecn, message)
    @ecn = ecn
    @message = message
    @email = EmailList.where(department: "Qantel").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'ECN '+@ecn.ecn_number.to_s+' approval', template_name: 'submitted'
  end
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ecn_notifier.submitted.subject
  #
  
  #------------------------------------------------#
  #The following methods are for closing ecn emails#
  def close_engineering(ecn, message)
    @ecn = ecn
    @message = message
    @email = EmailList.where(department: "Engineering").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail(to: to, subject: 'ECN '+@ecn.ecn_number.to_s+' released', template_name: 'closed')
  end
  
  def close_purchasing(ecn, message)
    @ecn = ecn
    @message = message
    @email = EmailList.where(department: "Purchasing").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail(to: to, subject: 'ECN '+@ecn.ecn_number.to_s+' released', template_name: 'closed')
  end
  
  def close_planning(ecn, message)
    @ecn = ecn
    @message = message
    @email = EmailList.where(department: "Planning").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail(to: to, subject: 'ECN '+@ecn.ecn_number.to_s+' released', template_name: 'closed')
  end
  
  def close_manufacturing(ecn, message)
    @ecn = ecn
    @message = message
    @email = EmailList.where(department: "Manufacturing").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail(to: to, subject: 'ECN '+@ecn.ecn_number.to_s+' released', template_name: 'closed')
  end
  
  def close_qantel(ecn, message)
    @ecn = ecn
    @message = message
    @email = EmailList.where(department: "Qantel").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail(to: to, subject: 'ECN '+@ecn.ecn_number.to_s+' released', template_name: 'closed')
  end
  
  def close_sales(ecn, message)
    @ecn = ecn
    @message = message
    @email = EmailList.where(department: "Sales").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail(to: to, subject: 'ECN '+@ecn.ecn_number.to_s+' released', template_name: 'closed')
  end
  
  def close_inventory(ecn, message)
    @ecn = ecn
    @message = message
    @email = EmailList.where(department: "Inventory").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail(to: to, subject: 'ECN '+@ecn.ecn_number.to_s+' released', template_name: 'closed')
  end
  
  def close_quality(ecn, message)
    @ecn = ecn
    @message = message
    @email = EmailList.where(department: "Quality").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail(to: to, subject: 'ECN '+@ecn.ecn_number.to_s+' released', template_name: 'closed')
  end
  
  def close_india(ecn, message)
    @ecn = ecn
    @message = message
    @email = EmailList.where(department: "India").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail(to: to, subject: 'ECN '+@ecn.ecn_number.to_s+' released', template_name: 'closed')
  end
  
  def close_finance(ecn, message)
    @ecn = ecn
    @message = message
    @email = EmailList.where(department: "Finance").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail(to: to, subject: 'ECN '+@ecn.ecn_number.to_s+' released', template_name: 'closed')
  end
  
end