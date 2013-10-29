class EcnNotifier < ActionMailer::Base
  default from: "engineering_notices@wilfley.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ecn_notifier.closed.subject
  #
  def submit_engineering(ecn)
    @ecn = ecn
    @email = EmailList.where(department: "Engineering").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'ECN approval', template_name: 'submitted'
  end
  
  def submit_purchasing(ecn)
    @ecn = ecn
    @email = EmailList.where(department: "Purchasing").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'ECN approval', template_name: 'submitted'
  end
  
  def submit_planning(ecn)
    @ecn = ecn
    @email = EmailList.where(department: "Planning").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'ECN approval', template_name: 'submitted'
  end
  
  def submit_manufacturing(ecn)
    @ecn = ecn
    @email = EmailList.where(department: "Manufacturing").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'ECN approval', template_name: 'submitted'
  end
    
  def submit_qantel(ecn,emails)
    @ecn = ecn
    @email = EmailList.where(department: "Qantel").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'ECN approval', template_name: 'submitted'
  end
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ecn_notifier.submitted.subject
  #
end