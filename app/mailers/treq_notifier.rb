class TreqNotifier < ActionMailer::Base
  default from: "engineering_notices@wilfley.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.treq_notifier.new_treq.subject
  #
  def submit_treq(treq)
    @treq = treq
    @email = EmailList.where(department: "Test").all
    @email2 = EmailList.where(department: "Test-Technician").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    @email2.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'TREQ '+@treq.test_number.to_s+' submitted', template_name: 'new_treq'
  end
end
