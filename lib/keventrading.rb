require 'nokogiri'
require 'open-uri'

  crypto_names = []
  crypto_prices = []
  source = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))
  source.xpath('//a[contains(@class,"cmc-table__column-name--name cmc-link")]').each do |row|
    crypto_names.push(row.text)
  end
  puts crypto_names

  #source.xpath('//a[@class="price"]').each do |row|
    #crypto_prices.push(row.text)
  #end

  #crypto_list = crypto_names.zip(crypto_prices)
  #puts crypt
