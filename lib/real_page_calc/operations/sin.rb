module RealPageCalc
  module Operation
    class Sin < Base
      def evaluate
        Math.public_send(operator, operands.last)
      end

      def self.arity
        1
      end

      private

      def operator
        :sin
      end
    end
  end
end
