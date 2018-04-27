# frozen_string_literal: true

# app/models/alias.rb
class Alias < ApplicationRecord
  has_many :ingredients
end
