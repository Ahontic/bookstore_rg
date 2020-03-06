# frozen_string_literal: true

ActiveAdmin.register Cart do
  permit_params :status, :customer_id, :delivery_id, :credit_card_id, :use_billing, :number
end
