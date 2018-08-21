module RealPageCalc
  module IO
    class Abstract
      def input
        raise NotImplementedError
      end

      def output
        raise NotImplementedError
      end
    end
  end
end
