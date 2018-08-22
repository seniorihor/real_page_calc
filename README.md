# RealPageCalc

A command-line reverse polish notation (RPN) calculator, written in Ruby.

## Installation

Clone this github repository to your computer:

    $ git clone git@github.com:seniorihor/real_page_calc.git

And then execute:

    $ bundle

Or install it from RubyGems:

    $ gem install real_page_calc

## Usage

To interact with `real_page_calc`, invoke it from your console with argument `rpn`:

    $ exe/real_page_calc rpn

Additionally, you can specify Input/Output interface (currently, only `standard` supported):

    $ exe/real_page_calc rpn --io=standard

Example Input/Output
-----------------------

    > 5
    5.0
    > 8
    8.0
    > +
    13.0

---

    > 5 8 +
    13.0
    > 13 -
    0.0

---

    > -3
    -3.0
    > -2
    -2.0
    > *
    6.0
    > 5
    5.0
    > +
    11.0

---

    > 5
    5.0
    > 9
    9.0
    > 1
    1.0
    > -
    8.0
    > /
    0.625

#### Supported Commands

- Operators: addition (`+`), subtraction (`-`), multiplication (`*`), and division (`/`).
- Values: integers (`3`), decimals (`3.5`), and negative numbers (`-3.5`).
- Exiting: `q` or `CTRL-D` returns to the shell.

## Technical Choices

`real_page_calc` uses Hanami::CLI - general purpose Command Line Interface (CLI) framework for Ruby.
This makes it possible to extend existing functionality with new subcommands with ease.

From perspective of architecture, `real_page_calc` is conteptually simple and contains 2 main parts:

- A class named RealPageCalc::CLI
Responsible for creating the REPL that a user interacts with.
It waits fot input from the user and pass it to InputParser.
If `q` or `CTRL-D` were typed, it will quit the program.

- A class named RealPageCalc::InputParser
Responsible for parsing an user input which represents a RPN expression and evaluating it to produce a result.
It is an operator-precedence parser implemented using stack-based shunting yard algorithm.

Currently, there are 4 basic operators and a standard I/O interface.
In future, it can be easily extended with other operators and alternative interfaces (such as WebSocket, file, or TCP socket).

## Future Changes
- The calculator handles errors and recover gracefully, though it might be better user experience to display errors to the user.
- It would be nice to add more test coverage, especially for CLI part. As an option, tests could instantiate `real_page_calc` and interact with it in the same way that a user would.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/seniorihor/real_page_calc.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
