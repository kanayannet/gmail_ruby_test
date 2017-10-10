# coding: utf-8

require 'minitest/autorun'
require './lib/gmail_smtp'

class TestGmailSmtp < MiniTest::Unit::TestCase
  def setup
    @gmail_smtp = GmailSmtp.new()
  end
  def test_send
    ret = false
    begin
      @gmail_smtp.set_to_mail('kanayan-net@i.softbank.jp')
      @gmail_smtp.set_subject('題名です')
      @gmail_smtp.set_body("本文です\naaaa")
      ret = @gmail_smtp.send()
    rescue => errors
      p errors
    end
    assert_equal true,ret
  end
  def cleanup
    @gmail_smtp.close_gmail_smtp()
  end
end
exit
