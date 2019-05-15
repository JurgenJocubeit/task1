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

    it 'calculates an operation using word number functions' do
      answer = example.send(:times, example.send(:six)).call(example.send(:five))
      expect(answer).to eq(30)
    end

    it 'calculates each operation correctly' do
      expect(example.send(:times, 5).call(6)).to eq(30)
      expect(example.send(:plus, 9).call(1)).to eq(10)
      expect(example.send(:minus, 3).call(6)).to eq(3)
      expect(example.send(:divided_by, 2).call(8)).to eq(4)
    end

    it 'raises ArgumentError if args are not Integer in operator functions' do
      expect { example.send(:times, '6').call(5) }.to raise_error(ArgumentError)
      expect { example.send(:plus, '9').call(1) }.to raise_error(ArgumentError)
      expect { example.send(:minus, '3').call(6) }.to raise_error(ArgumentError)
      expect { example.send(:divided_by, '2').call(8) }.to raise_error(ArgumentError)
    end
  end
end
