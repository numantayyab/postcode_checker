class PostCodeChecker
	
	include HTTParty
	include ActiveModel::Validations
	
	ENDPOINT_URI  = 'http://postcodes.io/postcodes/'

	attr_accessor :code, :error, :file

	## took help from:
	#https://stackoverflow.com/questions/164979/regex-for-matching-uk-postcodes
	validates :code, format: { :with =>  /\A([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([AZa-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9]?[A-Za-z]))))(\s)?[0-9][A-Za-z]{2})\z/i, :message => "invalid postcode"}


	def initialize(code)
		self.code = code
		self.file = YAML.load_file(File.join(Rails.root, 'config/postcodes.yml')) rescue {} ## if no file, blank array
	end

	def search_code

		response = self.class.get ENDPOINT_URI + URI.encode(self.code)

		if response.code.eql? 200 ## postcode found, see if we allow it
			result = check_allowed_areas(response.parsed_response["result"]["lsoa"])
		elsif check_allowed_codes ## postcode not found, see if this is exeptional
			result = true
		else ## no match
			result = false
		end
		result
	end

	def check_allowed_codes
		file["post_codes_allowed"].include?(code.gsub(" ","").upcase)
	end

	def check_allowed_areas(lsoa)
		file["lsoa_allowed"].include?(lsoa.downcase)
	end

end