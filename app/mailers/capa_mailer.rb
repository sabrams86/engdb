class CapaMailer < ActionMailer::Base
  default from: "engineering_notices@wilfley.com"
  
  def submit_additional(capa, message, additionalemails, subject, file)
    @capa = capa
    @message = message
    @emails = additionalemails
    @subject = subject
    to = []
    to << @emails
      attachments[file.original_filename] = file.read() unless file.blank?
    mail to: to, subject: 'CAPA '+@capa.capa_number.to_s+' notification.'+'  '+@subject, template_name: 'capa_notify'
  end
  
  def submit_capa(capa)
    @capa = capa
    @email = EmailList.where(department: "Quality").all
    @email2 = EmailList.where(department: "Quality_backup").all
    to = []
    @email.each do |e|
      to.push e.email
    end
    @email2.each do |e|
      to.push e.email
    end
    mail to: to, subject: 'CAPA '+@capa.capa_number.to_s+' submitted', template_name: 'new_capa'
    end
  
  
  def assign_capa(capa, message, subject, file)
    @capa = capa
    lead= @capa.engineer
    @message = message
    @subject = subject
    @email = User.where(name: lead)
    to = []
    @email.each do |e|
      to.push e.email
    end
      attachments[file.original_filename] = file.read() unless file.blank?
    mail to: to, subject: 'CAPA '+@capa.capa_number.to_s+' assignment.'+'  '+@subject, template_name: 'capa_notify'
  end
  
  def resolve_capa(capa, message, subject, file)
    @capa = capa
    lead= @capa.engineer
    @message = message
    @subject = subject
    @email = EmailList.where(department: "Quality").all
    to = []
    @email.each do |e|
      to.push e.email
    end
      attachments[file.original_filename] = file.read() unless file.blank?
    mail to: to, subject: 'CAPA '+@capa.capa_number.to_s+' resolved.'+'  '+@subject, template_name: 'capa_notify'
  end
  
  def followup_capa(capa, message, additionalemails, subject, file)
    @capa = capa
    @message = message
    @emails = additionalemails
    @subject = subject
    to = []
    to << @emails
      attachments[file.original_filename] = file.read() unless file.blank?
    mail to: to, subject: 'CAPA '+@capa.capa_number.to_s+' follow up.'+'  '+@subject, template_name: 'capa_notify'
  end
  
end
