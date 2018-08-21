module RealPageCalc
  class InputParser
    SUPPORTED_OPERATORS = %w[+ - * /].freeze

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
          rhs = @stack.pop
          lhs = @stack.pop
          result = lhs.public_send(token, rhs)
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
