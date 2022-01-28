require 'rails_helper'

class PostCodeCheckerTest < ActiveSupport::TestCase
  

	RSpec.describe PostCodeChecker, :type => :model do
	  it "is valid with valid postcode" do
	  	expect(PostCodeChecker.new("Wr40sy")).to be_valid
	  end
	  
	  it "is not valid with non UK postcode" do
	  	expect(PostCodeChecker.new("12345")).to_not be_valid
	  end

	  it "should not allow this postcode " do
	  	checker = PostCodeChecker.new("SM4 6LD")
	  	expect(checker.search_code).to eq(false)
	  end
	  
	  it "should allow this postcode " do
	  	checker = PostCodeChecker.new("SH241AA")
	  	expect(checker.search_code).to eq(true)
	  end

	  it "should allow this LSOA " do
	  	checker = PostCodeChecker.new("SH241AA")
	  	expect(checker.search_code).to eq(true)
	  end

	  it "should not allow this LSOA" do
	  	checker = PostCodeChecker.new("WR40SY")
	  	expect(checker.search_code).to eq(false)
	  end

	end
end 