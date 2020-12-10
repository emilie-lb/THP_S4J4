# https://blog.engineyard.com/getting-started-with-nokogiri

require 'open-uri'
require 'nokogiri'

$base_url = "http://www2.assemblee-nationale.fr/"
#"http://www2.assemblee-nationale.fr/deputes/liste/tableau"

def get_deputy_email(deputy_url)
  page = Nokogiri::HTML(open(deputy_url))
  name = page.xpath('//div[@class= "titre-bandeau-bleu clearfix"]/h1')
  email = page.xpath('//article/div[3]/div/dl/dd[4]/ul/li[2]/a')
  return mailto = {name.text => email.text}
end

def get_deputy_url(url)
	suffix_url_array = []
	deputy_page = Nokogiri::HTML(open(url))
	deputy_page.xpath('//tr/td[1]/a/@href').each do |lien|
		suffix_url_array << lien.text[1..-1]
	end
	return suffix_url_array

end	
#puts get_email("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA856")
#puts get_deputy_url("http://www2.assemblee-nationale.fr/deputes/liste/tableau")

def perform(url)
	emails_array = []
	suffix_url_array = get_deputy_url(url)
	suffix_url_array.each do |suffix_url|
		puts deputy_url = $base_url + suffix_url
		emails_array << get_deputy_email(deputy_url)
	end	
	return emails_array
end	

puts perform("http://www2.assemblee-nationale.fr/deputes/liste/tableau")

#//tr[25]/td[1]/a

#<td data-sort="Baichere" class="sorting_1"><a href="/deputes/fiche/OMC_PA721776">M. Didier Baichère</a></td>
=begin
/html/body/div/div[3]/div/div/div/section[1]/div/article/div[2]/h1
/html/body/div/div[3]/div/div/div/section[1]/div/article/div[2]/h1
div class : titre-bandeau-bleu clearfix /h1

puts annuaire.size
"http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA856"

=end