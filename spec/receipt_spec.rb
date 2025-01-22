# frozen_string_literal: true

require 'receipt'
require 'cart_item'

describe Receipt do
  let(:items) do
    [
      CartItem.new(name: 'book', price: 12.49, quantity: 2, imported: false),
      CartItem.new(name: 'music CD', price: 14.99, quantity: 1, imported: false),
      CartItem.new(name: 'chocolate bar', price: 0.85, quantity: 1, imported: false)
    ]
  end

  let(:receipt) { described_class.new(items:) }

  describe '#total_sales_tax' do
    it 'calculates the total sales tax correctly' do
      expect(receipt.total_sales_tax).to eq(1.50)
    end
  end

  describe '#total_cost' do
    it 'calculates the total cost correctly' do
      expect(receipt.total_cost).to eq(42.32)
    end
  end

  describe '#print' do
    let(:expected_output) { "2 book: 24.98\n1 music CD: 16.49\n1 chocolate bar: 0.85\nSales Taxes: 1.50\nTotal: 42.32" }

    it 'formats the receipt correctly' do
      expect(receipt.print).to eq(expected_output.strip)
    end
  end
end