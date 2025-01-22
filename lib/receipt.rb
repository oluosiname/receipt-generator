# frozen_string_literal: true

class Receipt
  def initialize(items:)
    @items = items
  end

  def total_sales_tax
    @items.sum(&:sales_tax)
  end

  def total_cost
    @items.sum(&:total_price)
  end

  def print
    lines = @items.map do |item|
      "#{item.quantity} #{item.name}: #{format('%.2f', item.total_price)}"
    end

    lines << "Sales Taxes: #{format('%.2f', total_sales_tax)}"
    lines << "Total: #{format('%.2f', total_cost)}"
    lines.join("\n")
  end
end
