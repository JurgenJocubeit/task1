# frozen_string_literal: true

require 'spec_helper'

SimpleCov.command_name 'test:integration'

RSpec.describe 'integration' do
  describe Calculator do
    before :each do
      extend Calculator
    end

    it 'returns an integer for each number function when called without an arg' do
      Calculator::NUMBERS.each_with_index do |word, int|
        expect(send(word.to_sym)).to eq(int)
      end
    end

    it 'returns an integer if no remainder for division operation' do
      answer = six(divided_by(three))
      expect(answer).is_a?(Integer)
      expect(answer).to eq(2)
    end

    it 'returns a float only when necessary for division operation' do
      answer = three(divided_by(six))
      expect(answer).is_a?(Float)
      expect(answer).to eq(0.5)
    end

    it 'raises ArgumentError if args are not Integer in operator functions' do
      expect do
        six(divided_by('three'))
      end.to raise_error(ArgumentError)
    end

    it 'allows LHS operand which is zero to be divided by any number' do
      answer = zero(divided_by(six))
      expect(answer).to eq(0)
    end

    it 'raises ZeroDivisionError when attempting to use zero as RHS operand' do
      expect { one(divided_by(zero)) }.to raise_error(ZeroDivisionError)
    end

    it 'calculates correct results as per examples' do
      expect(six(times(five))).to eq(30)
      expect(one(plus(nine))).to eq(10)
      expect(six(minus(three))).to eq(3)
      expect(eight(divided_by(two))).to eq(4)
    end
  end
end
