# frozen_string_literal: true

# Provides calculation methods.
module Calculator
  # Store 0-9 as words in array - order is important as we use the indices.
  NUMBERS = %i[zero one two three four five six seven eight nine].freeze

  # Define a function for each number.
  # Each function expects to receive an operation proc with RHS operand
  # argument otherwise it returns a proc evaluating to an Integer
  # representation of its function namesake.
  NUMBERS.each_with_index do |word, int|
    define_method(word) do |operation = proc { |num| num }|
      operation.call(int)
    end
  end
end
