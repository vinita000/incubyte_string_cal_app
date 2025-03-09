# String Calculator

This is a simple string calculator that adds numbers provided in a string format. It supports custom delimiters, newline characters, and handles various edge cases like empty strings, negative numbers, and invalid inputs.

  Features
    ✅ Supports adding numbers in a string format.
    ✅ Handles commas (,) and newlines (\n) as delimiters.
    ✅ Allows custom delimiters (e.g., "//;\n1;2;3" results in 6).
    ✅ Returns 0 for an empty string.
    ✅ Raises an exception for negative numbers.
    ✅ Worked for numbers greater than 1000.

## Installation

1. Clone the repository:
    ```sh
    git clone <git@github.com:vinita000/incubyte_string_cal_app.git>
    cd string_calculator
    ```

2. Install the dependencies:
    ```sh
    bundle install
    ```

## Usage

To use the string calculator, create an instance of the ManipulateString class and call the .add() method with a string of numbers.

```rb
require_relative 'manipulate_string'

calculator = ManipulateString.new
result = calculator.add("1,2,3")
puts result # Output: 6


## Running Tests

RSpec is used for testing. To run the tests, use:

```sh
rspec
```

## Example Test Output

```
ManipulateString
  returns 0 for an empty string
  adds numbers separated by commas
  handles newlines as delimiters
  supports custom delimiters
  raises an exception for negative numbers
  ignores numbers greater than 1000

7 examples, 0 failures
```
