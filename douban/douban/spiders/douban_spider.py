import scrapy

from douban.items import DoubanItem

class DoubanSpider(scrapy.Spider):
	name = "douban"
	allowed_domains = ["douban.com"]
	start_urls = [
		"http://movie.douban.com"
	]

	def parse(self,response):
		for href in response.css("div.list > a::attr('href')"):
			url = response.urljoin(href.extract())
			yield scrapy.Request(url,callback = self.parse_dir_contents)
			
	def parse_dir_contents(self,response):
		for sel in response.xpath('//div[@id ="content"]'):
			item = DoubanItem()


			yield item

			
				

			