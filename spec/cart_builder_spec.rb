# frozen_string_literal: true

require 'cart_builder'
require 'cart_item'
require 'line_parser'

describe CartBuilder do
  describe '#build' do
    let(:lines) do
      [
        '2 book at 12.49',
        '1 music CD at 14.99',
        '1 chocolate bar at 0.85'
      ]
    end

    subject { described_class.new(lines:) }

    context 'when all lines are valid' do
      it 'returns an array of CartItem objects' do
        cart_items = subject.build

        expect(cart_items.size).to eq(3)
        expect(cart_items).to all(be_a(CartItem))

        expect(cart_items[0]).to have_attributes(name: 'book', price: 12.49, quantity: 2)
        expect(cart_items[1]).to have_attributes(name: 'music CD', price: 14.99, quantity: 1)
        expect(cart_items[2]).to have_attributes(name: 'chocolate bar', price: 0.85, quantity: 1)
      end
    end

    context 'when LineParser raises an error' do
      let(:lines) { ['invalid line'] }

      it 'raises an ArgumentError for invalid lines' do
        expect { subject.build }.to raise_error(ArgumentError, 'Line format is invalid: invalid line')
      end
    end
  end
end
