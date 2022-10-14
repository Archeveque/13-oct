require 'rubygems'
require 'nokogiri'
require 'open-uri'

townhall_mail = []
townhall_name =[]

def get_townhall_urls(townhall_name,townhall_mail)      #scrap the name of the towns

page = Nokogiri::HTML(URI.open("http://www.annuaire-des-mairies.com/val-d-oise.html"))

page.xpath('//a[contains(@class,"lientxt")]').each do |name|
  #you can use //a[contains[.....]/@href to directly have the link (but my way was funnier)
  townhall_url=name.text.downcase!.gsub(" ", "-")             #edit format for the name (to put it in the url) (((Saint Roger ->>> saint-roger)))
  townhall_email(townhall_url,townhall_name,townhall_mail)    #scrap the email adress of the townhall
  puts "#{townhall_url} done."                                #say wich town was scrapped
end
townhall_and_mail = townhall_name.zip(townhall_mail)    #creating a hash with the name of the twon and the email
puts townhall_and_mail
end


def townhall_email(townhall_url,townhall_name,townhall_mail)#scrap the email adress of the townhall using the town naùe as the url
townhall_name.push (townhall_url)
page = Nokogiri::HTML(URI.open("http://www.annuaire-des-mairies.com/95/#{townhall_url}.html"))
page.xpath('//main[contains(@class,"page-content")]/section[last()-2]//tbody//tr[last()-1]//td[last()]').each do |mail| #scrap the email adress
  townhall_mail.push(mail.text)
end
return townhall_mail
return townhall_name
end


#/////////////////////////
def old_townhall_email(townhall_url) #previous version of the code

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
