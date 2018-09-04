module RealPageCalc
  class InputParser
    def initialize(input, stack)
      @input = input
      @stack = stack.dup
      @error = false
    end

    def parse
      tokens.each do |token|
        case
        when numeric?(token)
          @stack.push(token.to_f)
        when operator?(token)
          operation = OPERATION_CLASSES.fetch(token)
          next if @stack.size < operation.arity

          begin
            result = operation.call(@stack.pop(operation.arity))
            @stack.push(result) unless result && result.nan?
          rescue ZeroDivisionError
            puts "Zero division is not allowed"
          end
        else
          @error = true
        end
      end
      @stack
    end

    def valid?
      !@error
    end

    private

    def tokens
      @input.split(" ")
    end

    def operator?(token)
      SUPPORTED_OPERATORS.include?(token)
    end

    def numeric?(token)
      Float(token)
    rescue ArgumentError
      false
    end
  end
end
