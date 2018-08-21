require_relative "abstract"

module RealPageCalc
  module IO
    class Standard < Abstract
      def input
        print "> "
        expression = STDIN.gets&.strip&.chomp
        expression unless expression.nil? || expression == "q"
      end

      def output(result)
        STDOUT.puts result
      end
    end
  end
end
