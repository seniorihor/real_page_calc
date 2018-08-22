module RealPageCalc
  module Operation
    class Base
      def self.call(operands)
        new(operands).evaluate
      end

      def initialize(operands)
        @operands = operands
      end

      def evaluate
        raise NotImplementedError
      end

      private

      attr_reader :operands
    end
  end
end
