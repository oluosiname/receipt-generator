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

  def sales_tax
    unit_sales_tax * quantity
  end

  def total_price
    (price + unit_sales_tax) * quantity
  end

  private

  def unit_sales_tax
    @unit_sales_tax ||= TaxCalculator.new(price: price, imported: imported, name: name).total_sales_tax
  end
end
