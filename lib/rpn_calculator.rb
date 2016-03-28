# Using style guide from https://github.com/styleguide/ruby
module RpnCalculator
	VALID_OPERATORS = ['+', '-', '*', '/']
	COMMAND_CLEAR = 'c'
	COMMAND_SHOW = 's'
	COMMAND_QUIT = 'q'

	def RpnCalculator.is_number_or_operator?(value)
    if is_number(value) || is_operator(value)
      return true
    else
      return false
    end
	end

	def RpnCalculator.is_operator(value)
  	return VALID_OPERATORS.include?(value)
	end

	def RpnCalculator.is_number(value)
  	return value.match(/^-?\d+\.?\d{0,2}$/)
	end

	def RpnCalculator.evaluate_buffer(buffer)
  	# Defensive check for erroneous buffer
  	if buffer != nil && buffer.length == 0
    	puts "# Invalid or empty buffer."
    	return
  	end
  
  	# If operator is entered, make sure there are enough operands
  	if buffer.length <= 2 && is_operator(buffer.last)
    	puts "# Invalid operation:  not enough operands in buffer " +
    		"(need at least 2)."
    	buffer.pop
    	return
  	end
  
  	# if not an operator and valid, print input; otherwise, print calculation
  	if is_operator(buffer.last)
    	result = 0.0
    
    	operator = buffer.pop
    	b = buffer.pop
    	a = buffer.pop
    
    	div_by_zero = false
    
    	case
    	when operator == '+'
      	result = a + b  
    	when operator == '-'
      	result = a - b
    	when operator == '*'
      	result = a * b
    	when operator == '/'
    		if b == 0
    			puts "Invalid operation:  Divide by zero not allowed."
    			div_by_zero = true
    		else
    			result = (a.to_f / b.to_f)
    		end
    	end
    
    	if !div_by_zero
    		puts result
    		buffer.push(result)
    	end
  	else
    	puts buffer.last
  	end
	end

	def RpnCalculator.show_buffer(buffer)
		if buffer != nil
			p buffer
		end
	end
		
	def RpnCalculator.clear_buffer(buffer)
		if buffer != nil
			buffer.clear
		end
	end
	
	def RpnCalculator.add_to_buffer(buffer, item)
		if buffer != nil
			buffer.push(item)
		end
	end
	
	def RpnCalculator.run
		buffer = []
		input = ""

		puts "# Turning on..."
		puts "#  ---------------------------------------------------"
		puts "# | Name:         rpn_calc.rb"
		puts "# | Description:  Reverse Polish Notation Calculator"
		puts "# | By:           Tom LePage"
		puts "# | Date:         03/24/2016"
		puts "# | Language:     Ruby"
		puts "#  ---------------------------------------------------"
		puts "# Commands:"
		puts "# 'q' - Quit"
		puts "# 'c' - Clear Buffer"
		puts "# 's' - Show Buffer"
		puts "# Type in any number (decimal and negatives allowed)"
		puts "# Operators supported:  +, -, *, /"
	
		begin
  		print "> "
  		input = gets.chomp
  
  		if input == COMMAND_SHOW
    		show_buffer(buffer)
  		elsif input == COMMAND_CLEAR
    		clear_buffer(buffer)
    		puts "# Buffer Cleared"
  		elsif input == COMMAND_QUIT
  			puts "# Clearing buffer..."
    		clear_buffer(buffer)
    		puts "# Turning off..."
  		elsif is_number_or_operator?(input)
    		if is_number(input)
      		if input.include?(".")
        		# buffer.push(input.to_f)
        		add_to_buffer(buffer, input.to_f)
      		else
        		# buffer.push(input.to_i)
        		add_to_buffer(buffer, input.to_i)
      		end
    		else
      		# buffer.push(input)
      		add_to_buffer(buffer, input)
    		end
    
    		evaluate_buffer(buffer)
  		else
    		puts "# Invalid input entered.  Please review instructions " +
    			"for valid inputs."
  		end
		end while !(input == COMMAND_QUIT)
	end
end
