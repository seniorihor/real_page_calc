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
          next if @stack.size < 2
          result = OPERATION_CLASSES.fetch(token).call(@stack.pop(2))
          @stack.push(result) unless result.nan?
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
