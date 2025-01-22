# frozen_string_literal: true

require 'tax_calculator'

describe TaxCalculator do
  describe '#total_sales_tax' do
    context 'when the item is exempt and not imported' do
      it 'returns 0' do
        tax_calculator = described_class.new(price: 12.49, imported: false, name: 'book')
        expect(tax_calculator.total_sales_tax).to eq(0)
      end
    end

    context 'when the item is taxable and not imported' do
      it 'calculates basic sales tax' do
        tax_calculator = described_class.new(price: 14.99, imported: false, name: 'music CD')
        expect(tax_calculator.total_sales_tax).to eq(1.50)
      end
    end

    context 'when the item is exempt and imported' do
      it 'calculates import duty only' do
        tax_calculator = described_class.new(price: 0.85, imported: true, name: 'chocolate bar')
        expect(tax_calculator.total_sales_tax).to eq(0.05)
      end
    end

    context 'when the item is taxable and imported' do
      it 'calculates both basic sales tax and import duty' do
        tax_calculator = described_class.new(price: 27.99, imported: true, name: 'imported bottle of perfume')
        expect(tax_calculator.total_sales_tax).to eq(4.20)
      end
    end
  end
end
