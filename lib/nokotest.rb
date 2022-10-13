require 'rubygems'
require 'nokogiri'
require 'open-uri'
n=0
page = Nokogiri::HTML(URI.open("http://watashiwa7.altervista.org/ie/2/recruit-cheat-codes-inazuma-eleven-2-npc.htm"))
page.xpath('//table/tr/td[last()-1]').each do |link|
  n=n+1
  print "#{n} // "
  puts link.text
end
puts page.xpath('//table/td[last-1]')
