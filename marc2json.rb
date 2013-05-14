require 'rubygems'
require 'json'
require 'stringio'
require 'json'

def marc_dict
	dict = Hash.new
	dict.store("001","control_number")
	dict.store("008","fixed_length")
	dict.store("020","isbn")
	dict.store("041","language_code")
	dict.store("043","geographic_area_code")
	dict.store("073","organization_code")
	dict.store("074","gpo_item_no")
	dict.store("084","other_classification_no")
	dict.store("089","unknown")
	dict.store("110","primary_name")
	dict.store("270","address")
	dict.store("271","additional_address")
	dict.store("272","unknown")
	#dict.store("273","unknown")
	dict.store("273","phone_or_hours_of_operation")
	#dict.store("274","unknown")
	dict.store("274","fax")
	#dict.store("275","address_associated_with_title")
	dict.store("275","tty")
	#dict.store("276","unknown")
	dict.store("276","email")
	dict.store("277","unknown")
	dict.store("284","unknown")
	dict.store("287","unknown")
	#dict.store("307","hours")
	dict.store("307","service_hours")
	dict.store("308","film_description")
	dict.store("505","program_note")
	#dict.store("520","description_note")
	dict.store("520","description")
	#dict.store("521","target_group_note")
	dict.store("521","target_group")
	dict.store("522","geographic_coverage_note")
	#dict.store("528","unknown")
	dict.store("528","services_provided")
	#dict.store("531","eligibility_fees_procedures")
	dict.store("531","eligibility_requirements")
	#dict.store("532","unknown")
	dict.store("532","fees")
	#dict.store("533","reproduction_note")
	dict.store("533","how_to_apply")
	#dict.store("534","original_version_note")
	dict.store("534","service_wait")
	dict.store("536","funding_source_note")
	#dict.store("546","language_note")
	dict.store("546","languages_spoken")
	dict.store("563","binding_information")
	dict.store("570","personnel_note")
	#dict.store("574","transportation_directions_note")
	dict.store("574","transportation_availability")
	#dict.store("575","accomodations_for_disabled_note")
	dict.store("575","accessibility")
	#dict.store("653","index_term_uncontrolled")
	dict.store("653","organization_type")
	dict.store("690","local_subject_access_field")
	#dict.store("691","local_subject_access_field")
	dict.store("691","keywords")
	dict.store("700","added_entry-personal")
	dict.store("710","added_entry-corporate")
	#dict.store("856","electronic_location_access")
	dict.store("856","url")
	dict.store("907","local_call_numbers")
	dict.store("913","local_call_numbers")
	dict.store("914","local_call_numbers")
	dict.store("950","local_call_numbers")
	dict.store("998","local_call_numbers")

	return dict
end

def marc_020
	# http://www.loc.gov/marc/bibliographic/bd020.html
	dict = Hash.new
	dict.store("a","isbn")
	dict.store("c","terms_of_availability")
	dict.store("z","canceled_isbn")
	dict.store("6","linkage")
	dict.store("8","field_link_sequence_no")

	return dict
end

def marc_041
	# http://www.loc.gov/marc/bibliographic/bd041.html
	dict = Hash.new
	dict.store("a","sound_tack")
	dict.store("b","abstract")
	dict.store("d","spoken_text")
	dict.store("e","librettos")
	dict.store("f","table_of_contents")
	dict.store("g","accompanying_materal")
	dict.store("h","original")
	dict.store("j","subtitles")
	dict.store("k","intermediate_translation")
	dict.store("m","original_accompanying_materials")
	dict.store("n","original_libretto")
	dict.store("2","source_of_code")
	dict.store("6","linkage")
	dict.store("8","field_link_sequence_no")

	return dict
end

def marc_043
	#http://www.loc.gov/marc/community/ci043.html
	dict = Hash.new
	dict.store("a","geographica_area_code")
	dict.store("b","local_gac_code")
	dict.store("c","iso_code")
	dict.store("0","authority_record_control_no")
	dict.store("2","source_of_local_code")
	dict.store("8","field_link_sequence_no")

	return dict
end

def marc_073
	# http://www.loc.gov/marc/community/ci073.html
	dict = Hash.new
	dict.store("a","organization_code")
	dict.store("2","code_source")
	dict.store("6","linkage")
	dict.store("8","field_link_sequence_no")

	return dict 
end

def marc_074
	# http://www.loc.gov/marc/bibliographic/bd074.html
	dict = Hash.new
	dict.store("a","gpo_item_no")
	dict.store("z","canceled_gpo_item_no")
	dict.store("8","field_link_sequence_no")

	return dict 
end

def marc_084
	# http://www.loc.gov/marc/community/ci084.html
	dict = Hash.new
	dict.store("a","classification_no")
	dict.store("2","number_source")
	dict.store("6","linkage")
	dict.store("8","field_link_sequence_no")

	return dict 
end

def marc_110
	# made this shit up based on data
	dict = Hash.new
	dict.store("a","name")
	dict.store("b","organization")

	return dict 
end

def marc_270
	# http://www.loc.gov/marc/community/ci270.html
	dict = Hash.new
	dict.store("a","address")
	dict.store("b","city")
	dict.store("c","state")
	dict.store("d","country")
	#dict.store("e","postal_code")
	dict.store("e","zipcode")
	dict.store("f","title_before_attention_name")
	dict.store("g","attention_name")
	dict.store("h","title_following_attention_name")
	dict.store("i","type_of_address")
	dict.store("j","specialized_phone_n0")
	dict.store("k","telephone_no")
	dict.store("l","fax_no")
	dict.store("m","email")
	dict.store("n","tdd_number")
	dict.store("p","contact_person")
	dict.store("q","title_of_contact_person")
	dict.store("r","hours")
	dict.store("z","public_note")
	dict.store("4","relator_code")
	dict.store("6","linkage")
	dict.store("8","field_link_sequence_no")
	
	return dict 
end

def marc_271
	# http://www.loc.gov/marc/community/ci2xx.html
	dict = Hash.new
	dict.store("a","address")
	dict.store("b","city")
	dict.store("c","state")
	dict.store("d","country")
	dict.store("e","postal_code")
	dict.store("f","title_before_attention_name")
	dict.store("g","attention_name")
	dict.store("h","title_following_attention_name")
	dict.store("i","type_of_address")
	dict.store("j","specialized_phone_n0")
	dict.store("k","telephone_no")
	dict.store("l","fax_no")
	dict.store("m","email")
	dict.store("n","tdd_number")
	dict.store("p","contact_person")
	dict.store("q","title_of_contact_person")
	dict.store("r","hours")
	dict.store("6","linkage")
	dict.store("8","field_link_sequence_no")

	return dict 
end

def marc_273
	# made up this shit based on data
	dict = Hash.new
	dict.store("a","phone")
	dict.store("b","name_of_location_of_host")
	dict.store("z","days_hours_of_operation")

	return dict 
end


def marc_275
	# http://www.loc.gov/marc/community/ci2xx.html
		dict = Hash.new
	dict.store("a","address")
	dict.store("b","city")
	dict.store("c","state")
	dict.store("d","country")
	dict.store("e","postal_code")
	dict.store("f","title_before_attention_name")
	dict.store("g","attention_name")
	dict.store("h","title_following_attention_name")
	dict.store("i","type_of_address")
	dict.store("j","specialized_phone_n0")
	dict.store("k","telephone_no")
	dict.store("l","fax_no")
	dict.store("m","email")
	dict.store("n","tdd_number")
	dict.store("p","contact_person")
	dict.store("q","title_of_contact_person")
	dict.store("z","tty")
	dict.store("6","linkage")

	return dict 
end

def marc_307
	# http://www.loc.gov/marc/community/ci307.html
	dict = Hash.new
	dict.store("'#'","no_information_provided")
	dict.store("8","no_display_constant")
	dict.store("a","hours")
	dict.store("b","additional_information")
	dict.store("6","linkage")
	dict.store("8","field_link_sequence_no")

	return dict 
end

def marc_505
	# http://www.loc.gov/marc/community/ci505.html
	dict = Hash.new
	dict.store("a","specific_programs_note")
	dict.store("6","linkage")
	dict.store("8","field_link_sequence_no")

	return dict 
end

def march_521
	#http://www.loc.gov/marc/community/ci521.html
	dict = Hash.new
	dict.store("a","target_group_note")
	dict.store("6","linkage")
	dict.store("8","field_link_sequence_no")

	return dict
end

def marc_522
	# http://www.loc.gov/marc/community/ci522.html
	dict = Hash.new
	dict.store("a","geographic_are_note")
	dict.store("6","linkage")
	dict.store("8","field_link_sequence_no")

	return dict 
end

def marc_531
	# http://www.loc.gov/marc/community/ci531.html
	dict = Hash.new
	dict.store("a","eligibility")
	dict.store("b","fee")
	dict.store("c","admission_procedures")
	dict.store("d","documents_required")
	dict.store("e","waiting_list")
	dict.store("d","waiting_period")
	dict.store("6","linkage")
	dict.store("8","field_link_sequence_no")

	return dict 
end

def marc_533
	#http://www.loc.gov/marc/bibliographic/bd533.html
	dict = Hash.new
	#dict.store("a","main_entry_of_original")
	dict.store("a","application")
	dict.store("b","edition_statement_of_original")
	dict.store("c","publication")
	dict.store("e","physical_description")
	dict.store("f","series_statement")
	dict.store("k","key_title")
	dict.store("l","location")
	dict.store("m","material_specific_details")
	dict.store("n","note_about_original")
	dict.store("o","other_resource_identifier")
	dict.store("p","introductory_phrase")
	dict.store("t","title_statement")
	dict.store("x","international_standard_serial_number")
	dict.store("s","isbn")
	dict.store("3","materials_specified")
	dict.store("6","linkage")
	dict.store("8","field_link_sequence_no")

	return dict 
end

def marc_536
	# http://www.loc.gov/marc/community/ci536.html
	dict = Hash.new
	dict.store("a","funding_source_note")
	dict.store("6","linkage")
	dict.store("8","field_link_sequence_no")
	
	return dict 
end

def marc_546
	# http://www.loc.gov/marc/community/ci546.html
	dict = Hash.new
	dict.store("a","language_note")
	dict.store("6","linkage")
	dict.store("8","field_link_sequence_no")

	return dict 
end

def marc_563
	# http://www.loc.gov/marc/bibliographic/bd563.html
	dict = Hash.new
	dict.store("a","binding_note")
	dict.store("b","uniform_resource_identifier")
	dict.store("3","materials_specified")
	dict.store("5","institution_to_which_field_applies")
	dict.store("6","linkage")
	dict.store("8","field_link_sequence_no")
	
	return dict
end

def marc_570
	# http://www.loc.gov/marc/community/ci570.html
	dict = Hash.new
	dict.store("a","personnel_note")
	dict.store("b","election_information")
	dict.store("6","linkage")
	dict.store("8","field_link_sequence_no")

	return dict 
end

def march_574
	# http://www.loc.gov/marc/community/ci574.html
	dict = Hash.new
	dict.store("a","transportation_directions_note")
	dict.store("6","linkage")
	dict.store("8","field_link_sequence_no")

	return dict 
end

def marc_575
	# http://www.loc.gov/marc/community/ci575.html
	dict = Hash.new
	#dict.store("a","accomodations_for_disabled_note")
	dict.store("a","accomodations_for_disabled")
	dict.store("6","linkage")
	dict.store("8","field_link_sequence_no")

	return dict 
end

def marc_653
	# http://www.loc.gov/marc/community/ci653.html
	dict = Hash.new
	#dict.store("a","uncontrolled_term")
	dict.store("a","keyword")
	dict.store("6","linkage")
	dict.store("8","field_link_sequence_no")

	return dict
end

def marc_700
	# http://www.loc.gov/marc/community/ci700.html
	dict = Hash.new
	dict.store("a","personal_name")
	dict.store("b","numeration")
	dict.store("c","titles")
	dict.store("d","dates_associated_with_name")
	dict.store("e","relator_term")
	dict.store("f","date_of+_work")
	dict.store("g","miscellaneous_information")
	dict.store("j","attribution_qualitfier")
	dict.store("n","number_of_part")
	dict.store("p","name_of_part")
	dict.store("q","fuller_form_of_name")
	dict.store("s","version")
	dict.store("t","title")
	dict.store("u","affiliation")
	dict.store("0","authority_record_control_no")
	dict.store("4","relator_code")
	dict.store("6","linkage")
	dict.store("8","field_link_sequence_no")

	return dict 
end

def marc_710
	# http://www.loc.gov/marc/community/ci710.html
	dict = Hash.new
	dict.store("a","corporate_or_juristiction_name")
	dict.store("b","subordinate_unit")
	dict.store("c","location_of_meeting")
	dict.store("d","date_of_meeting")
	dict.store("e","relator_term")
	dict.store("f","date_of_work")
	dict.store("g","miscellaneous_information")
	dict.store("n","number_of_part")
	dict.store("p","name_of_part")
	dict.store("s","version")
	dict.store("t","title")
	dict.store("u","affiliation")
	dict.store("0","authority_record_control_no")
	dict.store("4","relator_code")
	dict.store("6","linkage")
	dict.store("8","field_link_sequence_no")

	return dict 
end

def marc_856
	# http://www.loc.gov/marc/community/ci856.html
	dict = Hash.new
	dict.store("a","host_name")
	dict.store("b","access_no")
	dict.store("c","compression_information")
	dict.store("d","path")
	dict.store("f","electronic_name")
	dict.store("h","processor_of_request")
	dict.store("i","instruction")
	dict.store("j","bits_per_second")
	dict.store("k","password")
	dict.store("l","logon")
	dict.store("m","contact_for_access_assistance")
	dict.store("n","name_of_location_of_host")
	dict.store("o","operating_system")
	dict.store("p","port")
	dict.store("q","electronic_format_type")
	dict.store("r","settings")
	dict.store("s","file_size")
	dict.store("t","terminal_emulation")
	dict.store("u","uniform_resource_identifier")
	dict.store("v","hours_access_method_available")
	dict.store("w","record_control_no")
	dict.store("x","nonpublic_note")
	dict.store("y","link_text")
	dict.store("z","public_note")
	dict.store("2","access_method")
	dict.store("3","materials_specified")
	dict.store("6","linkage")
	dict.store("8","field_link_sequence_no")
	
	return dict
end

def field(marc_id)
	dict = Hash.new
	dict = dict.send("marc_dict")
	field = dict.fetch(marc_id)

	return field
end

def subfield(id,marc_id, element)
	subfield_hash = Hash.new
	dict = Hash.new
	dict = dict.send("marc_#{marc_id}")
	subfield_array = Array.new
	if element.count('|') > 1
		row = element[7..element.length].chomp.split("|")
        row.each do |subfield|
			subfield_array.push(dict.fetch(subfield[0..0]).to_s => subfield[1..subfield.length])
		end
	else
		subfield_array.push(dict.fetch(element[7..7]).to_s => element[8..element.length].delete("|").chomp)
	end

	return subfield_array
end

def record_to_json_marc(record)
	rec = Array.new
	record.each_line do |row|
		item = case row[0..2]
		 	when "EOR" then rec.push("end" => row.chomp)
			when "LDR" then rec.push("begin" => row.chomp)
			when "001" then rec.push({row[0..2] => row[4..row.length].chomp})
			when "008" then rec.push({row[0..2] => row[4..row.length].rstrip.chomp})
			when "043" then rec.push({row[0..2] => subfield(rec[1],"043",row)})
			#when "110" then rec.push({field(row[0..2]) => row[7..row.length].chomp.split("|")})
			when "110" then rec.push({row[0..2] => subfield(rec[1],"110",row)})
			when "270" then rec.push({row[0..2] => subfield(rec[1],"270",row)})
			when "271" then rec.push({row[0..2] => subfield(rec[1],"271",row)})	
			when "273" then rec.push({row[0..2] => subfield(rec[1],"273",row)})
			when "522" then rec.push({row[0..2] => subfield(rec[1],"522",row)})
			when "653" then rec.push({row[0..2] => subfield(rec[1],"653",row)})
			when "700" then rec.push({row[0..2] => subfield(rec[1],"700",row)})
			when "907" then rec.push({row[0..2] => row[7..row.length].chomp.split("|")})
			when "998" then rec.push({row[0..2] => row[7..row.length].chomp.split("|")})
			else rec.push({row[0..2] => row[8..row.length].delete("|").chomp})
		end
	end
	return rec
end

def record_to_json(record)
	rec = Array.new
	record.each_line do |row|
		item = case row[0..2]
		 	when "EOR" then rec.push("end" => row.chomp)
			when "LDR" then rec.push("begin" => row.chomp)
			when "001" then rec.push({field(row[0..2]) => row[4..row.length].chomp})
			when "008" then rec.push({field(row[0..2]) => row[4..row.length].rstrip.chomp})
			when "043" then rec.push({field(row[0..2]) => subfield(rec[1],"043",row)})
			#when "110" then rec.push({field(row[0..2]) => row[7..row.length].chomp.split("|")})
			when "110" then rec.push({field(row[0..2]) => subfield(rec[1],"110",row)})
			when "270" then rec.push({field(row[0..2]) => subfield(rec[1],"270",row)})
			when "271" then rec.push({field(row[0..2]) => subfield(rec[1],"271",row)})	
			when "273" then rec.push({field(row[0..2]) => subfield(rec[1],"273",row)})
			when "522" then rec.push({field(row[0..2]) => subfield(rec[1],"522",row)})
			when "653" then rec.push({field(row[0..2]) => subfield(rec[1],"653",row)})
			when "700" then rec.push({field(row[0..2]) => subfield(rec[1],"700",row)})
			when "907" then rec.push({field(row[0..2]) => row[7..row.length].chomp.split("|")})
			when "998" then rec.push({field(row[0..2]) => row[7..row.length].chomp.split("|")})
			else rec.push({field(row[0..2]) => row[8..row.length].delete("|").chomp})
		end
	end
	return rec
end

def record_to_json_mvp(record)
	rec = Array.new
	record.each_line do |row|
		item = case row[0..2]
			#when "001" then rec.push({"id" => row[4..row.length].chomp})
			when "110" then rec.push(field(row[0..2]) => subfield(rec[1],"110",row))
			when "270" then rec.push(field(row[0..2]) => subfield(rec[1],"270",row))
			when "273" then rec.push(field(row[0..2]) => subfield(rec[1],"273",row))
			when "274" then rec.push(field(row[0..2]) => row[8..row.length].delete("|").chomp)
			when "275" then rec.push(field(row[0..2]) => subfield(rec[1],"275",row))
			when "276" then rec.push(field(row[0..2]) => row[8..row.length].delete("|").chomp)
			when "307" then rec.push(field(row[0..2]) => subfield(rec[1],"307",row))
			when "520" then rec.push(field(row[0..2]) => row[8..row.length].delete("|").chomp)
			when "521" then rec.push(field(row[0..2]) => row[8..row.length].delete("|").chomp)
			when "528" then rec.push(field(row[0..2]) => row[8..row.length].delete("|").chomp)
			when "531" then rec.push(field(row[0..2]) => subfield(rec[1],"531",row))
			when "532" then rec.push(field(row[0..2]) => row[8..row.length].delete("|").chomp)
			when "533" then rec.push(field(row[0..2]) => subfield(rec[1],"533",row))
			when "534" then rec.push(field(row[0..2]) => row[8..row.length].delete("|").chomp)
			when "546" then rec.push(field(row[0..2]) => subfield(rec[1],"546",row))
			when "574" then rec.push(field(row[0..2]) => row[8..row.length].delete("|").chomp)
			when "575" then rec.push(field(row[0..2]) => subfield(rec[1],"575",row))
			when "653" then rec.push(field(row[0..2]) => subfield(rec[1],"653",row))
			when "691" then rec.push(field(row[0..2]) => row[8..row.length].delete("|").chomp)
			when "856" then rec.push(field(row[0..2]) => row[8..row.length].delete("|").chomp)
		end
	end
	return rec
end


def normalize_mvp(mvp_record)
	normal = Array.new
	ph = Array.new
	keywords_array = Array.new
	mvp_record.each do |element|
		if element.has_key?("primary_name")
			ary = element.values[0]
			ary.each do |hsh|
				normal.push(hsh)
			end
		elsif element.has_key?("service_hours")
			if element.values[0].size == 1
				normal.push({"service_hours" => element.values[0]})
			end
		elsif element.has_key?("address")
			ary = element.values[0]
			ary.each do |hsh|
				normal.push(hsh)
			end
		elsif element.has_key?("phone_or_hours_of_operation")
			phone_array = Array.new
			ary = element.values[0]			
			ary.each do |hsh|
				hsh.each do |key, value|
					#puts value
					case value
					when /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
						phone_array.push("number" => value)
					when /day/
						phone_array.push("phone_hours" => value)
					when /hours/
						phone_array.push("phone_hours" => value)
					when /daily/
						phone_array.push("phone_hours" => value)
					when /nights/
						phone_array.push("phone_hours" => value)
					when /weekend/
						phone_array.push("phone_hours" => value)
					when /holidays/
						phone_array.push("phone_hours" => value)
					else
						phone_array.push("department" => value)
					end
				end
			end
			ph.push(phone_array)
		elsif element.has_key?("tty")
			if element.values.length == 1
				normal.push("phones" => {"number" => element.values[0][0]["address"]})
			end
		elsif element.has_key?("eligibility_requirements")
			if element.values.length == 1
				normal.push("eligibility_requirements" => element.values[0][0]["eligibility"])
			end
		elsif element.has_key?("how_to_apply")
			if element.values.length == 1
				normal.push("how_to_apply" => element.values[0][0]["application"])
			end
		elsif element.has_key?("languages_spoken")
			normal.push("languages_spoken" =>element["languages_spoken"].map(&:values).flatten)
		elsif element.has_key?("accessibility")
			normal.push("accessibility" =>element["accessibility"].map(&:values).flatten)
		elsif element.has_key?("keywords")
			if element["keywords"].size < 2
				keywords_array.push(element["keywords"].map(&:values).flatten)
			else
				keywords_array.push(element["keywords"])
			end
		elsif element.has_key?("organization_type")			
			keywords_array.push(element["organization_type"].map(&:values).flatten)
			#normal.push("keywords" => keywords_array.flatten.uniq)
			#normal.push("keywords" => kw.uniq)			
		else
			normal.push(element)
		end
	end
	
	# add keywords
	if keywords_array.size > 0
		normal.push("keywords" => keywords_array.flatten.uniq)
	end

	# group by keys
	grouped = normal.group_by(&:keys).map{|k, v| {k.first => v.flat_map(&:values).flatten}}
	nrml = Array.new
	
	# remove arrays if only one value
	grouped.each do |hsh|
		hsh.each do |k, v|
			if v.size < 2
				nrml.push(k => v[0])
			else
				nrml.push(k => v)
			end
		end
	end
	
	# add phones
	if ph.size == 1
		nrml << {"phones" => ph.flatten(1)}
	else
		nrml << {"phones" => ph}
	end

	return nrml
end

def usage()
	puts "Usage:"
	puts "marc2json [format: cip, mvp] [file]"

	return
end

arguments = ARGV.size
record = StringIO.new

if ARGV.size < 2
	usage()
else
	file = ARGV[1]
	format = ARGV[0]
	File.open(file, 'r') do |file|
		while (line = file.gets)
			line.encode!('UTF-16', 'UTF-8', :invalid => :replace, :replace => '')
			line.encode!('UTF-8', 'UTF-16')
			record <<  line
			if line.chomp == "EOR"
				case format
				when "cip"
					puts record_to_json(record.string).to_json
				when "mvp"
					rec = record_to_json_mvp(record.string)
					puts normalize_mvp(rec).to_json
				else
					puts "unrecognized format"
					break
				end
				record.truncate(0)
				record.rewind			
			end
		end
	end 
end