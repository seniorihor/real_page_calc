RSpec.describe RealPageCalc::InputParser do
  def calculate(input, expected, stack = [])
    described_class.new(input, stack).parse.tap do |result|
      expect(result).to eq [expected].flatten.compact.map(&:to_f)
    end
  end

  it "valid expression" do
    expression = described_class.new("3 3 +", [])
    expression.parse
    expect(expression.valid?).to be true
  end

  it "invalid expression" do
    expression = described_class.new("six", [])
    expression.parse
    expect(expression.valid?).to be false
  end

  it "addition" do
    calculate("3 3 +", 6)
  end

  it "subtraction" do
    calculate("6 3 -", 3)
  end

  it "multiplication" do
    calculate("3 3 *", 9)
  end

  it "division" do
    calculate("6 3 /", 2)
  end

  it "multi digit operands" do
    calculate("33 3 /", 11)
  end

  it "negative operands" do
    calculate("-3 2 *", -6)
  end

  it "decimal operands" do
    calculate("2.5 2 /", 1.25)
  end

  it "nested operations" do
    calculate("3 3 + 3 * 3 - 3 /", 5)
  end

  it "successive operations" do
    stack = calculate("3 3 +", 6)
    calculate("3 *", 18, stack)
  end

  it "ommitting initial calculation" do
    stack = calculate("", nil)
    calculate("3 3 +", 6, stack)
  end

  it "result when more than one numbers are on stack" do
    stack = calculate("2 3", [2, 3])
    calculate("4 5 +", [2, 3, 9], stack)
  end

  it "operation without numbers on stack" do
    calculate("+", nil)
    calculate("-", nil)
    calculate("*", nil)
    calculate("/", nil)
  end

  it "ignores unrecognized input" do
    calculate("3h3 +", nil)
    calculate("3h3 1 +", 1)
    calculate("3 1 +?", [3, 1])
    calculate("3h 1 /", 1)
  end
end
