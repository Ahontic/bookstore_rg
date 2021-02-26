# frozen_string_literal: true

SimpleCov.start do
  minimum_coverage 90
  add_filter '/admin/'
  add_filter '/spec/'
end
