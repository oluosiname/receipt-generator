# frozen_string_literal: true

class LineParser
  LINE_REGEX = /^(\d+) (.+?) at (\d+\.\d{2})$/

  def self.parse(line)
    match = line.match(LINE_REGEX)
    raise ArgumentError, "Line format is invalid: #{line}" unless match

    quantity = match[1].to_i
    name = match[2]
    price = match[3].to_f
    imported = name.include?('imported')

    { quantity: quantity, name: name, price: price, imported: imported }
  end
end
