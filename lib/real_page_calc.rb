Dir.glob("lib/**/*.rb").each do |file|
  require file.gsub("lib/", "").gsub(".rb", "")
end

module RealPageCalc
  OPERATION_CLASSES = {
    "+" => Operation::Addition,
    "-" => Operation::Subtraction,
    "*" => Operation::Multiplication,
    "/" => Operation::Division
  }.freeze
  SUPPORTED_OPERATORS = OPERATION_CLASSES.keys.freeze
end
