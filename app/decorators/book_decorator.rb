# frozen_string_literal: true

class BookDecorator < Draper::Decorator
  delegate_all
  decorates_association :authors

  def dimensions
    "H:#{height}\" x W: #{width}\" x D: #{depth}\""
  end

  def authors_names
    authors.map(&:full_name).join(', ')
  end
end
