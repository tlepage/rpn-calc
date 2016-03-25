require "./lib/rpn_calculator.rb"
require "test/unit"

class TestRpnCalculator < Test::Unit::TestCase

	def test_clear
		buffer = [1, 2, 3, 4, '+']
		RpnCalculator.clear_buffer(buffer)
		assert_equal([], buffer)
	end
	
	def test_show
		buffer = [1, 2, 3, '-']
		RpnCalculator.show_buffer(buffer)
		assert_equal([1, 2, 3, '-'], buffer)
	end
	
	def test_invalid_buffer
		buffer = [1, '+']
		RpnCalculator.evaluate_buffer(buffer)
		assert_equal([1], buffer)
	end
	
	def test_disallow_divide_by_zero
		buffer = [1, 0, '/']
		RpnCalculator.evaluate_buffer(buffer)
		assert_equal([], buffer)
		
		buffer = [1, 2, 3, 4, 5, 6, 0, '/']
		RpnCalculator.evaluate_buffer(buffer)
		assert_equal([1, 2, 3, 4, 5], buffer)
	end
	
	def test_add
		buffer = [1, 2, '+']
		RpnCalculator.evaluate_buffer(buffer)
		assert_equal([3], buffer)
		
		buffer = [1, 2, 3, 4, 5, 6, 7, '+']
		RpnCalculator.evaluate_buffer(buffer)
		assert_equal([1, 2, 3, 4, 5, 13], buffer)
	end
	
	def test_subtract
		buffer = [1, 2, '-']
		RpnCalculator.evaluate_buffer(buffer)
		assert_equal([-1], buffer)
		
		buffer = [1, 2, 3, 4, 5, 6, 7, '-']
		RpnCalculator.evaluate_buffer(buffer)
		assert_equal([1, 2, 3, 4, 5, -1], buffer)
	end
	
	def test_multiply
		buffer = [5, 2, '*']
		RpnCalculator.evaluate_buffer(buffer)
		assert_equal([10], buffer)
		
		buffer = [1, 2, 3, 4, 5, 6, 7, '*']
		RpnCalculator.evaluate_buffer(buffer)
		assert_equal([1, 2, 3, 4, 5, 42], buffer)
	end
	
	def test_divide
		buffer = [10, 2, '/']
		RpnCalculator.evaluate_buffer(buffer)
		assert_equal([5], buffer)
		
		buffer = [1, 2, 3, 4, 5, 42, 7, '/']
		RpnCalculator.evaluate_buffer(buffer)
		assert_equal([1, 2, 3, 4, 5, 6], buffer)
	end
	
	def test_decimal
		buffer = [1.5, 2.1, '+']
		RpnCalculator.evaluate_buffer(buffer)
		assert_equal([3.6], buffer)
		
		buffer = [6.5, 2.2, '*']
		RpnCalculator.evaluate_buffer(buffer)
		assert_equal([14.3], buffer)
	end
	
	def test_decimal_with_integer
		buffer = [1.5, 2, '+']
		RpnCalculator.evaluate_buffer(buffer)
		assert_equal([3.5], buffer)
		
		buffer = [5, 3.5, '-']
		RpnCalculator.evaluate_buffer(buffer)
		assert_equal([1.5], buffer)
	end
	
	def test_negative
		buffer = [-1, -2, '+']
		RpnCalculator.evaluate_buffer(buffer)
		assert_equal([-3], buffer)
		
		buffer = [1, 2, -3, 4, 5, -6, 7, '-']
		RpnCalculator.evaluate_buffer(buffer)
		assert_equal([1, 2, -3, 4, 5, -13], buffer)
	end
	
end