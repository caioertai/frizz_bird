# frozen_string_literal: true

# config/initializers/money.rb

Money.default_formatting_rules = {
  decimal_mark: ',',
  thousands_separator: '.'
}
MoneyRails.configure do |config|
  config.default_currency = :brl
end
