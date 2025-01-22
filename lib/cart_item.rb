# frozen_string_literal: true

require_relative 'tax_calculator'

class CartItem
  attr_reader :name, :quantity, :price, :imported

  def initialize(name:, price:, quantity:, imported:)
    @name = name
    @price = price
    @quantity = quantity
    @imported = imported
  end
end
