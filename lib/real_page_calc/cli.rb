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

        def call(*)
          puts "calculating RPN..."
        end
      end

      register "rpn", RPN
    end
  end
end
