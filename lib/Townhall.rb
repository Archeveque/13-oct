require 'rubygems'
require 'nokogiri'
require 'open-uri'
townhall_url = "saint-cezaire-sur-siagne"

townhall_mail = []
townhall_name =[]

def get_townhall_urls(townhall_name,townhall_mail)

page = Nokogiri::HTML(URI.open("http://www.annuaire-des-mairies.com/val-d-oise.html"))

page.xpath('//a[contains(@class,"lientxt")]').each do |name|
  #you can use //a[contains[.....]/@href to directly have the link (but my way was funnier)
  townhall_url=name.text.downcase!.gsub(" ", "-")
  townhall_email(townhall_url,townhall_name,townhall_mail)
  puts "#{townhall_url} done."
end
townhall_and_mail = townhall_name.zip(townhall_mail)
puts townhall_and_mail
end


def townhall_email(townhall_url,townhall_name,townhall_mail)
townhall_name.push (townhall_url)
page = Nokogiri::HTML(URI.open("http://www.annuaire-des-mairies.com/95/#{townhall_url}.html"))
page.xpath('//main[contains(@class,"page-content")]/section[last()-2]//tbody//tr[last()-1]//td[last()]').each do |mail|
  townhall_mail.push(mail.text)
end
return townhall_mail
return townhall_name
end



def old_townhall_email(townhall_url)

townhall_mail = []
crypto_values = []
page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/06/#{townhall_url}.html"))

page.xpath('//main[contains(@class,"page-content")]/section[last()-2]//tbody//tr[last()-1]//td[last()]').each do |mail|
  puts mail.text
  townhall_mail.push(mail.text)
end
end
get_townhall_urls(townhall_name,townhall_mail)
puts " "
