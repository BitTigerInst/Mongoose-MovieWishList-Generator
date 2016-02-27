# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class DoubanItem(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()
    title = scrapy.Field()
    info = scrapy.Field()
    rating = scrapy.Field()
    watched_count = scrapy.Field()
    wish_count = scrapy.Field()
    recomend_list = scrapy.Field()
    tags_list = scrapy.Field()