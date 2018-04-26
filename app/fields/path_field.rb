# frozen_string_literal: true

require 'administrate/field/base'

# app/fields/path_field.rb
class PathField < Administrate::Field::Base
  def path
    "#{ENV['ext_source']}#{data}"
  end
end
