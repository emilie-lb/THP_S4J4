
require_relative '../lib/crypto_scrapeur'

describe "the scrap_bitcoins method" do
  it "verify if the result is not empty " do
    expect(scrap_bitcoins).not_to be_nil
  end
  
  it "verify if result is an array" do
  	expect(scrap_bitcoins).to be_a_kind_of(Array)     
  end

  it "verify if array contains hash" do
  	expect(scrap_bitcoins[5]).to be_a_kind_of(Hash)
  end

# je n'arrive pas à formuler ce test...
  it "it includes XRP symbol as a key" do
    
      #expect(scrap_bitcoins).to have_key("XRP") 
      expect(scrp_bitcoins).to include(have_attributes("XRP"))
   
  end

=begin
    scrap_bitcoins.each do |hash|
      #if 
        expect(hash).to include("XRP") 
        #break
      #end
    end
  end 
=end
end