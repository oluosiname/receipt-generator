# frozen_string_literal: true

require 'cart_item'
require 'tax_calculator'

describe CartItem do
  describe '#sales_tax' do
    it 'returns the total sales tax for the item' do
      item = described_class.new(name: 'music CD', price: 14.99, quantity: 1, imported: false)
      expect(item.sales_tax).to eq(1.50)
    end
  end

  describe '#total_price' do
    it 'returns the total price including sales tax' do
      item = described_class.new(name: 'imported bottle of perfume', price: 27.99, quantity: 1, imported: true)
      expect(item.total_price).to eq(32.19)
    end
  end
end
