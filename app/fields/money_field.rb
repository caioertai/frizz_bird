# frozen_string_literal: true

require 'administrate/field/base'

# app/fields/money_field.rb
class MoneyField < Administrate::Field::Base
  def money
    data.format
  end
end
