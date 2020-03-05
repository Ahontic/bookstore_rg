# frozen_string_literal: true

class HomePage < SitePrism::Page
  set_url '/'

  element :slider, '#slider'
  element :home_page_link, :link, I18n.t(:home), match: :first
  element :get_started, :button, I18n.t(:get_started)
  element :latest_books, '#latest_books'
  element :best_sellers, '#best_sellers'
  element :buy_now_button, :button, 'Buy Now'
end
