
require 'nokogiri'
require 'open-uri'


$base_url = "https://www.annuaire-des-mairies.com/"

def get_townhall_email(townhall_url)

  townhall_page = Nokogiri::HTML(open(townhall_url))
  town_name = townhall_page.xpath('//section[1]//p[1]/strong[1]/a')
  townhall_email = townhall_page.xpath('//section[2]//tr[4]/td[2]') #('//*[contains(text(), "@")]')
  return mailto = {town_name.text => townhall_email.text}
end

#puts get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")

def get_townhall_urls (county_url)
	townhall_suffix_url_array = []
	county_page = Nokogiri::HTML(open(county_url))
	county_page.xpath('//a[@class="lientxt"]//@href').each do |town|
		townhall_suffix_url_array << town.text.gsub("./", "")
	end
	return townhall_suffix_url_array
end

#puts get_townhall_urls("https://www.annuaire-des-mairies.com/val-d-oise.html")

def perform (county_url)
	townhall_emails_array = []
	townhall_suffix_url_array = get_townhall_urls (county_url)
	townhall_suffix_url_array.each do |suffix_url|
		puts townhall_url = $base_url + suffix_url
		townhall_emails_array << get_townhall_email(townhall_url)
	end	
	return townhall_emails_array
end	

puts perform ("https://www.annuaire-des-mairies.com/val-d-oise.html")


	

