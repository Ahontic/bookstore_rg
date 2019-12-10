# frozen_string_literal: true

class BookDecorator < Draper::Decorator
  delegate_all
  decorates_association :author

  def dimensions
    "H:#{height}\" x W: #{width}\" x D: #{depth}\""
  end
end
