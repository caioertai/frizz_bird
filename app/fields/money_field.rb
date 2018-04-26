# frozen_string_literal: true

require 'administrate/field/base'

# app/fields/money_field.rb
class MoneyField < Administrate::Field::Base
  def money
    "R$#{(data.to_f / 100).round(2)}".tr('.', ',')
  end
end
