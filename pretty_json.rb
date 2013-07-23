require 'rubygems'
require 'json'


file = open("data_out/test.json")
#json = file.read
#parsed = JSON.parse(json)
#puts JSON.pretty_generate(parsed)

while (line = file.gets)
    puts JSON.pretty_generate(JSON.parse(line))
end
file.close