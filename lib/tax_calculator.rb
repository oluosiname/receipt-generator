# frozen_string_literal: true

require_relative 'utils/rounder'

class TaxCalculator
  include Rounder

  BASIC_SALES_TAX_RATE = 0.10
  IMPORT_DUTY_RATE = 0.05
  EXEMPT_CATEGORIES = {
    'book' => ['book'],
    'food' => ['food', 'chocolate', 'chocolates', 'chocolate bar'],
    'medical' => ['pills']
  }.freeze

  def initialize(name:, price:, imported:)
    @price = price
    @imported = imported
    @name = name
  end

  def total_sales_tax
    basic_tax = exempt? ? 0 : price * BASIC_SALES_TAX_RATE
    import_duty = imported ? price * IMPORT_DUTY_RATE : 0

    Rounder.ceil_to_nearest(basic_tax + import_duty, 0.05)
  end

  private

  attr_reader :price, :imported, :name

  def exempt?
    EXEMPT_CATEGORIES.values.flatten.any? { |category| name.include?(category) }
  end
end
