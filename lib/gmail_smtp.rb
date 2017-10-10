# coding: utf-8

class GmailSmtp
  require 'gmail'
  def initialize()
    @gmail = Gmail.new('xxxxxxxx', 'xxxxxxxx')
    @subject = ''
    @body = ''
    @to_mail = ''
  end
  def set_subject(subject)
    @subject = subject
    return true
  end
  def set_body(body)
    @body = body
    return true
  end
  def set_to_mail(mail)
    @to_mail = mail
    return true
  end
  def send()
    body = @body
    to_mail = @to_mail
    message =
      @gmail.generate_message do
        to to_mail
        subject @subject
        text_part do
          body body
        end
      end
    @gmail.deliver(message)
    return true
  end
  def close_gmail_smtp()
    @gmail.logout
  end
end
