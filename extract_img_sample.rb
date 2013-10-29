# coding: utf-8

require 'nokogiri'
require 'open-uri'

target_url = "http://minne.com/items/209975"
#target_url = "http://www.anam-leather.com/items/31039"
#target_url = "http://item.rakuten.co.jp/mb/-x-et51-bridle-x-/"
#target_url = "http://item.rakuten.co.jp/mapsports-syuppin/fuji2013_palette_black?s-id=top_normal_browsehist"
#target_url = "http://www.amazon.co.jp/gp/product/B00FBYIFDO/ref=s9_wish_gw_d10_g200_i2?ie=UTF8&colid=1Q1JUH8QR51BZ&coliid=I2YCHW9T8IEBKK&pf_rd_m=AN1VRQENFRJN5&pf_rd_s=center-4&pf_rd_r=1X8KJZCFS1BKQFEWMK8A&pf_rd_t=101&pf_rd_p=148901169&pf_rd_i=489986"

doc = Nokogiri::HTML(open(target_url))
p doc.xpath('//title/text()').to_s
p doc.xpath('(//h1)[1]/text()').to_s.strip

doc.xpath('//img[contains(@src, ".jpg") or contains(@src, ".JPG")][not(contains(@src, "thumb"))][not(@width) or not(@height) or (@width > 100 and @height > 100)]').each do |img|
  p img.attribute("src").to_s
end
