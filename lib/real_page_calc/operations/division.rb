module RealPageCalc
  module Operation
    class Division < Base
      def evaluate
        lhs, rhs = operands
        lhs.public_send(operator, rhs)
      end

      private

      def operator
        :/
      end
    end
  end
end
