# frozen_string_literal: true

class AuthorDecorator < Draper::Decorator
  delegate_all
  decorates_association :books

  def full_name
    "#{first_name} #{last_name}"
  end
end
