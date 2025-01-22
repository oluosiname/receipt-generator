# frozen_string_literal: true

require 'line_parser'

describe LineParser do
  describe '.parse' do
    context 'when the line is valid' do
      let(:line) { '2 book at 12.49' }

      it 'parses the line correctly' do
        result = described_class.parse(line)
        expect(result).to eq({ quantity: 2, name: 'book', price: 12.49, imported: false })
      end

      context 'when imported' do
        it 'parses the line correctly' do
          result = described_class.parse('1 imported bottle of perfume at 47.50')
          expect(result).to eq({ quantity: 1, name: 'imported bottle of perfume', price: 47.50, imported: true })
        end
      end
    end

    context 'when the line is invalid' do
      context 'when line is malformed' do
        let(:line) { 'invalid line' }

        it 'raises Argument error' do
          expect { described_class.parse(line) }.to raise_error(ArgumentError, 'Line format is invalid: invalid line')
        end
      end

      context 'when line missing quantity' do
        let(:line) { 'book at 12.49' }

        it 'raises an ArgumentError' do
          expect { described_class.parse(line) }.to raise_error(ArgumentError, 'Line format is invalid: book at 12.49')
        end
      end

      context 'when missing price' do
        let(:line) { '2 books at' }

        it 'raises an ArgumentError for a line' do
          expect { described_class.parse(line) }.to raise_error(ArgumentError, 'Line format is invalid: 2 books at')
        end
      end
    end
  end
end
