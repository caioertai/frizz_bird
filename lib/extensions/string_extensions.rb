# frozen_string_literal: true

# /lib/extensions/string_extensions.rb
class String
  def numeric?
    return true if self =~ /\A\d+\Z/
    begin
      true if Float(self)
    rescue StandardError
      false
    end
  end
end
