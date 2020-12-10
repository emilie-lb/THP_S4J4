
require 'nokogiri'
require 'open-uri'

$page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))


def scrap_bitcoins
	crypto_array =[]
	crypto_hash = Hash.new

	$page.xpath('//tr').each do |node|
		key = node.xpath('td[2]').text
		value = node.xpath('td[5]').text.gsub(/[,$]/, "").to_f
		if key != ""
			crypto_hash = {key => value}
			crypto_array << crypto_hash
		end
	end
	return crypto_array

end	

puts scrap_bitcoins

=begin CI DESSOUS,PREMIERE SOLUTION MAIS MOINS ROBUSTE
def scrap_name_array
	crypto_name_array = []
	$page.xpath('//td[2]').each do |name|
		crypto_name_array << name.text
	end
	return crypto_name_array
end

def scrap_value_array
	crypto_value_array = []
	$page.xpath('//td[5]').each do |value|
		crypto_value_array << value.text.gsub(/[,$]/, "").to_f
	end
	return crypto_value_array
end

def scrap_bitcoins
	crypto_name_array = scrap_name_array
	crypto_value_array = scrap_value_array
	crypto_hash = Hash.new
	bitcoins_array_of_hash = []
	i = 0
	crypto_name_array.each do |name|
		crypto_hash = {name => crypto_value_array[i]}
		bitcoins_array_of_hash << crypto_hash
		i +=1
	end 

	return bitcoins_array_of_hash
	#puts crypto_name_array.length
	#puts crypto_value_array.length
	
	#array_of_hash = crypto_name_array.zip(crypto_value_array).to_h
	# bitcoins_array_of_hashes.class
end	
=end



