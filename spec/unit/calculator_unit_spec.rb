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

    it 'returns an integer for each number function when called without an arg' do
      Calculator::NUMBERS.each_with_index do |word, int|
        expect(example.send(word.to_sym)).to eq(int)
      end
    end

    it 'responds to functions for operators' do
      %i[divided_by minus plus times].each do |word|
        expect(example).to respond_to(word.to_sym)
      end
    end

    it 'calculates an operation that returns a proc that can be called with an arg' do
      answer = example.send(:times, 6).call(5)
      expect(answer).to eq(30)
    end
  end
end
