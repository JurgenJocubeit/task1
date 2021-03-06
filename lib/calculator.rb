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

  # Operation function for division.
  def divided_by(right_operand)
    raise ArgumentError unless right_operand.is_a?(Integer)

    proc do |left_operand|
      # Allow zero in the left_operand only.
      raise ZeroDivisionError if right_operand.zero?

      # Test if division will yield a remainder.
      if (left_operand.to_f % right_operand.to_f).zero?
        left_operand / right_operand # return Integer
      else
        left_operand.to_f / right_operand.to_f # return Float
      end
    end
  end

  # Operation function for subtraction.
  def minus(right_operand)
    raise ArgumentError unless right_operand.is_a?(Integer)

    proc { |left_operand| left_operand - right_operand }
  end

  # Operation function for addition.
  def plus(right_operand)
    raise ArgumentError unless right_operand.is_a?(Integer)

    proc { |left_operand| left_operand + right_operand }
  end

  # Operation function for multiplication.
  def times(right_operand)
    raise ArgumentError unless right_operand.is_a?(Integer)

    proc { |left_operand| left_operand * right_operand }
  end
end
