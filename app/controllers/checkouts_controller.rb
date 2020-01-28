# frozen_string_literal: true

class CheckoutsController < ApplicationController
  def show
    render 'checkout_address'
  end
end
