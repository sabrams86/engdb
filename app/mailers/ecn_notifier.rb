class EcnNotifier < ActionMailer::Base
  default from: "engineering_notices@wilfley.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ecn_notifier.closed.subject
  #
  def closed(ecn)
    @ecn = ecn
    mail to: "sabrams@arwilfley.com", subject: 'ECN closed'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ecn_notifier.submitted.subject
  #
  def submitted(ecn)
    @ecn = ecn
    mail to: "sabrams@arwilfley.com", subject: 'ECN approval'
  end
end
