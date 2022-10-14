require 'rubygems'
require 'nokogiri'
require 'open-uri'

def crypto_data #scrap the name of the crypto
n=0
crypto_names = []
crypto_values = []
page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
page.xpath('//a[contains(@class,"cmc-table__column-name--name cmc-link")]').each do |name_crypto|
  n = n + 1
  print "#{n} // "                    #puts a number before every name ( 1 // Bitcoin)
  puts name_crypto.text               #puts the name
  crypto_names.push(name_crypto.text) #insert the name inside an array
end

page.xpath('//*[contains(@class,"s395gx-1 eChPfw cmc-table-row")]').each do |name_crypto| #scrap the 21 to 200 crypto names
  n = n + 1
  print "#{n} // "
  puts name_crypto.text
  crypto_names.push(name_crypto.text)
end
n = 0
page.xpath('//div[contains(@class,"cmc-table__table-wrapper-outer")]//*[contains(@class,"cmc-link")]//span').each do |value_crypto| #scrap the value of the crypto
  n=n+1
  print "#{n} // "
  puts value_crypto.text
  crypto_values.push(value_crypto.text)
end
crypto_infos = crypto_names.zip(crypto_values)  #create a hash with the name and the value
print crypto_infos
puts " "
end

def test_crypto_data
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
page.xpath('//a[contains(@class,"cmc-table__column-name--name cmc-link")]').each do |name_crypto|
  return name_crypto.text
end
end

def test_crypto_value
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
  page.xpath('//div[contains(@class,"cmc-table__table-wrapper-outer")]//*[contains(@class,"cmc-link")]//span').each do |value_crypto|
  return value_crypto.text
end
end

def test_crypto_infos(crypto_names,crypto_values)
crypto_infos = crypto_names.zip(crypto_values)
return crypto_infos
end
crypto_data
