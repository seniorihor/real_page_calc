module RealPageCalc
  module Operation
    class Division < Base
      def evaluate
        lhs, rhs = operands
        if rhs.zero?
          raise ZeroDivisionError
        else
          lhs.public_send(operator, rhs)
        end
      end

      private

      def operator
        :/
      end
    end
  end
end
