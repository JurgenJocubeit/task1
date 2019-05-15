# frozen_string_literal: true

require 'spec_helper'

SimpleCov.command_name 'test:unit'

RSpec.describe 'unit' do
  describe Calculator do
    class Example
      include Calculator
    end

    subject(:example) do
      Example.new
    end

    it 'defines functions for each number word in Calculator::NUMBERS' do
      Calculator::NUMBERS.each do |word|
        expect(example).to respond_to(word.to_sym)
      end
    end
  end
end
