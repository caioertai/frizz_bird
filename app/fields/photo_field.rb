# frozen_string_literal: true

require 'administrate/field/base'

# app/fields/photo_field.rb
class PhotoField < Administrate::Field::Base
  def url
    data
  end
end
