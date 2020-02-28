# frozen_string_literal: true

class HomePage < SitePrism::Page
  set_url '/'

  element :slider, '#slider'
  element :home_page_link, :link, I18n.t(:home), match: :first
  element :get_started, :button, I18n.t(:get_started)
  element :title, 'h3'
  element :latest_books, I18n.t(:latest_books)
  element :best_sellers, I18n.t(:best_sellers)
end
