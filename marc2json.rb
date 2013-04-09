require 'rubygems'
require 'json'
require 'stringio'
require 'json'

def record_to_json(record)
	rec = Array.new
	record.each_line do |row|
		item = case row[0..2]
		 	when "EOR" then rec.push("end" => row.chomp)
			when "LDR" then rec.push("begin" => row.chomp)
			when "001" then rec.push({row[0..2] => row[4..row.length].chomp})
			when "008" then rec.push({row[0..2] => row[4..row.length].rstrip.chomp})
			when "043" then rec.push({row[0..2] => row[4..row.length].chomp.split("|")})
			when "110" then rec.push({row[0..2] => row[4..row.length].chomp.split("|")})
			when "270" then rec.push({row[0..2] => row[7..row.length].chomp.split("|")})
			when "271" then rec.push({row[0..2] => row[7..row.length].chomp.split("|")})	
			when "273" then rec.push({row[0..2] => row[7..row.length].chomp.split("|")})
			when "653" then rec.push({row[0..2] => row[7..row.length].chomp.split("|")})
			when "700" then rec.push({row[0..2] => row[7..row.length].chomp.split("|")})	
			when "907" then rec.push({row[0..2] => row[7..row.length].chomp.split("|")})	
			when "998" then rec.push({row[0..2] => row[7..row.length].chomp.split("|")})
			else rec.push({row[0..2] => row[6..row.length].delete("|").chomp})
		end
	end
	return rec
end

record = StringIO.new
r = Array.new



File.open('../data/SanMateoCIP.txt', 'r') do |file|
	while (line = file.gets)
		line.encode!('UTF-16', 'UTF-8', :invalid => :replace, :replace => '')
		line.encode!('UTF-8', 'UTF-16')

		record <<  line
		if line.chomp == "EOR"
			puts record_to_json(record.string).to_json
			record.truncate(0)
			record.rewind			
			#break
		end
		
	end
end 
