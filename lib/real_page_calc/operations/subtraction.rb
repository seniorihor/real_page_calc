module RealPageCalc
  module Operation
    class Subtraction < Base
      def evaluate
        lhs, rhs = operands
        lhs.public_send(operator, rhs)
      end

      private

      def operator
        :-
      end
    end
  end
end
