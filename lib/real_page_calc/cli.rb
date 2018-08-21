require "hanami/cli"

module RealPageCalc
  class CLI
    def call(*args)
      Hanami::CLI.new(Commands).call(*args)
    end

    module Commands
      extend Hanami::CLI::Registry

      class RPN < Hanami::CLI::Command
        desc "interactive reverse polish notation calculator"

        option :io,
               default: "standard",
               values: %w[standard websocket file tcpsocket],
               desc: "input/output interface"

        def call(**options)
          stack = []
          io = IO.const_get(options.fetch(:io).capitalize).new

          while (input = io.input)
            expression = InputParser.new(input, stack)
            result = expression.parse

            io.output(result)
            stack = result if expression.valid?
          end
        end
      end

      register "rpn", RPN
    end
  end
end
