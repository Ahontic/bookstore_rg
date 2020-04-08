# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'hwpauler@gmail.com'
  layout 'mailer'
end
