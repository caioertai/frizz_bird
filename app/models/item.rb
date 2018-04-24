# frozen_string_literal: true

class Item < ApplicationRecord
  validates :path, presence: true
end
