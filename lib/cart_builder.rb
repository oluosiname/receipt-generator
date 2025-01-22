# frozen_string_literal: true

require_relative 'cart_item'
require_relative 'line_parser'

class CartBuilder
  def initialize(lines:)
    @lines = lines
  end

  def build
    lines.map do |line|
      parsed_data = LineParser.parse(line)

      CartItem.new(
        name: parsed_data[:name],
        price: parsed_data[:price],
        quantity: parsed_data[:quantity],
        imported: parsed_data[:imported]
      )
    end
  end

  private

  attr_reader :lines
end
