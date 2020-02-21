# frozen_string_literal: true

class OrderMailer < ActionMailer::Base
  default from: 'hwpauler@gmail.com'

  def send_order_confirmation(customer)
    @customer = customer
    mail(to: @customer.email, subject: 'Order Confirmation')
  end
end
