# Receipt Generator

## Overview

The **Receipt Generator** is a Ruby-based project that calculates and prints receipts for a list of purchased items. It accounts for sales taxes, import duties, and tax exemptions, formatting the output to show itemized totals, sales taxes, and the grand total.

---

## Features

- Calculates sales tax and import duties based on item details.
- Supports exemptions for books, food, and medical products.
- Rounds taxes to the nearest 0.05 as per requirements.
- Outputs itemized receipts with formatted totals.

---

## Requirements

- **Ruby**: Version `3.3.0`
- **Dependencies**:
  - [Ruby](https://www.ruby-lang.org/en/)
  - [RSpec](https://rspec.info/) for testing.

---

## Installation

1. **Clone the Repository**:

   ```bash
   git clone <repository-url>

   cd receipt-generator
   ```

2. **Install Ruby**:
   Ensure you have Ruby `3.3.0` installed. Use a version manager like `rbenv` or `rvm`:

   ```bash
   rbenv install 3.3.0

   rbenv local 3.3.0
   ```

3. **Install Dependencies**:
   Install the required gems:

   ```bash
   gem install bundler

   bundle install
   ```

## Usage

1.  **Run the Script**:
    Pass the input file containing the list of items to the script:

    ```bash
    ruby lib.main.rb file_path
    or
    ./cart_app file_path

    # example ruby lib/main.rb './spec/fixtures/01_example.txt'
    # example  ./cart_app './spec/fixtures/01_example.txt'
    ```

2.  **Input File Format**:
    The input file should contain one item per line in the following format:

    ```bash
    <quantity> <name> at <price>
    ```

    Example

    ```bash
    2 book at 12.49
    1 music CD at 14.99
    1 chocolate bar at 0.85
    ```

3.  **Output:**
    The script generates an itemized receipt. For the example above:

    ```bash
    2 book: 24.98
    1 music CD: 16.49
    1 chocolate bar: 0.85
    Sales Taxes: 1.50
    Total: 42.32
    ```

## Testing

1.  **Run Tests**:
    To verify functionality, run the RSpec test suite:

    ```bash
    bundle exec rspec
    ```

## Project Structure

receipt-generator/
├── lib/
│ ├── cart_item.rb # Handles item details and calculations
│ ├── line_parser.rb # Parses input lines into structured data
│ ├── tax_calculator.rb # Computes sales tax and import duties
│ ├── receipt.rb # Generates and formats the receipt
│ └── main.rb # Main script for running the application
├── spec/
│ ├── cart_item_spec.rb # Tests for CartItem
│ ├── line_parser_spec.rb # Tests for LineParser
│ ├── tax_calculator_spec.rb # Tests for TaxCalculator
│ ├── receipt_spec.rb # Tests for Receipt
│ └── fixtures/ # Input test files
├── Gemfile # Defines gem dependencies
└── README.md # Project documentation
