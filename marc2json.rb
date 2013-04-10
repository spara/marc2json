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
	dict.store("043"."geographic_area_code")
	dict.store("073","organization_code")
	dict.store("074","gpo_item_no")
	dict.store("084"."other_classification_no")
	dict.store("089","unknown")
	dict.store("110","primary_name")
	dict.store("270","address")
	dict.store("271","additional_address")
	dict.store("272","unknown")
	dict.store("273","unknown")
	dict.store("274","unknown")
	dict.store("275","address_associated_with_title")
	dict.store("276","unknown")
	dict.store("277","unknown")
	dict.store("287","unknown")
	dict.store("307","hours")
	dict.store("308"."film_description")
	dict.store("505","program_note")
	dict.store("521","target_group_note")
	dict.store("522","geographic_coverage_note")
	dict.store("528","unknown")
	dict.store("531","eligibility_fees_procedures")
	dict.store("523","unkown")
	dict.store("533","reproduction_note")
	dict.store("534","original_version_note")
	dict.store("536","funding_source_note")
	dict.store("546","language_note")
	dict.store("563","binding_information")
	dict.store("570","personnel_note")
	dict.store("574","transportation_directions_note")
	dict.stoe("575","accomodations_for_disabld_note")
	dict.store("653","index_term_uncontrolled")
	dict.store("690","local_subject_access_field")
	dict.store("691","local_subject_access_field")
	dict.store("700","added_entry-personal")
	dict.store("710","added_entry-corporate")
	dict.store("856","electronic_location_access")
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

def marc_270
	# http://www.loc.gov/marc/community/ci270.html
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
	dict.store("6","linkage")

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
	dict.store("a","main_entry_of_original")
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
	dict.store("a","accomodations_for_disabled_note")
	dict.store("6","linkage")
	dict.store("8","field_link_sequence_no")

	return dict 
end

def check_row(element)
	if element.count('|') > 1
		row = element[7..element.length].chomp.split("|")
	else
		row = element[6..element.length].delete("|").chomp
	end
	return row
end

def record_to_json(record)
	rec = Array.new
	record.each_line do |row|
		item = case row[0..2]
		 	when "EOR" then rec.push("end" => row.chomp)
			when "LDR" then rec.push("begin" => row.chomp)
			when "001" then rec.push({row[0..2] => row[4..row.length].chomp})
			when "008" then rec.push({row[0..2] => row[4..row.length].rstrip.chomp})
			#when "043" then rec.push({row[0..2] => row[4..row.length].chomp.split("|")})
			when "043" then rec.push({row[0..2] => check_row(row)})
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
