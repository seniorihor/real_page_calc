Dir.glob("lib/**/*.rb").each do |file|
  require file.gsub("lib/", "").gsub(".rb", "")
end

module RealPageCalc
end
