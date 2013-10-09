class EcnNotifier < ActionMailer::Base
  default from: "engineering_notices@wilfley.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ecn_notifier.closed.subject
  #
  def submit_engineering(ecn)
    @ecn = ecn
    @email_list = EmailList.where(department: "engineering")
    
    to = []
    @email_list.each do |e|
        to.push e.email
    end
    mail to: to, subject: 'ECN approval', template_name: 'submitted'
  end
  
  def submit_purchasing(ecn)
    @ecn = ecn
    @email_list = EmailList.all
    mail to: "steven.abrams86@gmail.com", subject: 'ECN approval', template_name: 'submitted'
  end
  
  def submit_planning(ecn)
    @ecn = ecn
    @email_list = EmailList.all
#    mail to: "fonmus@gmail.com", subject: 'ECN approval', template_name: 'submitted'
  end
  
  def submit_manufacturing(ecn)
    @email_list = EmailList.all
 #   mail to: "fonmus@gmail.com", subject: 'ECN approval', template_name: 'submitted'
  end
    
  def submit_qantel(ecn,emails)
    @email = emails[:qantel]
    mail to: @email[:email], subject: 'ECN approval'  
  #  mail to: @email_list.where(department: "qantel"), subject: 'ECN approval', template_name: 'submitted'
  end
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ecn_notifier.submitted.subject
  #
end