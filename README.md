# Mongoose-MovieWishList-Generator  
# Description  
Movie is one of the hottest entertaiment for people nowadays. However,in most cases, it's not easy to find the right movie to watch. And people are usually not active to build their own movie wish list. So we are going to make one for them. Based on the analysis of movie databases from douban.com, we can generate the proper wish list for one particular user. It can be developed further to be a promotion for other movies.

# Architecture
First, we are going to make use of python scrapy to make our crawler scripts. The crawler downloads the information of the hottest movies(sorted by release date) as a json file. The file includes the basic info of the movie and the references of the users who are interested in it. Then we imported the json files into MongoDB for analysis.  
  
Second, we will do analysis on the movie databases and select top 5 movies that a particular user are most likely interested in. The selection algorithm may consider factors/parameters as user ratings, release date and whether it is popular. After the selection, we will add the 5 movie references to that particular user.  
  
Third, we will use react to render the movie wish list for users. In this way, our application covers full stacks.  
# Plan
[2016/02/01 - 2016/02/07] Project Selection, Plan Discussion, and Proposal Draft Writing  
[2016/02/08 - 2016/02/24] System Design, Resource Discovery, Project Implementation, Document Writing  
[2016/02/25 - 2016/02/29] User Manual Writing and Video Presentation Making  
Details of each schedule and task will be added later.  
# Resource
BitTiger Project list:  
https://slack-files.com/T0GUEMKEZ-F0J4G9QTT-274d3bc97e  
AppStore - Recommender:  
https://www.dropbox.com/s/03b0u71zevvk7pw/20160103_AppStore%20Recommender.pdf?dl=0  
https://www.youtube.com/watch?v=t1tSCbZxml4  
Scrapy documentation:  
http://scrapy.org/doc/  
MongoDB documentation:  
https://docs.mongodb.org/manual/  
react:  
https://www.dropbox.com/s/jmdveksujzp3utp/20160206React.mov?dl=0  
https://www.dropbox.com/s/s1pnpkgzkoykbf9/20160206AppStoreinReact.pdf?dl=0  
# Language & Framework  
javascript,  
python, scrapy framework,  
mongoDB  
react  
# Owner
@Team: Mongoose  
@Members: @xinyzhang9, @ztsuperman, @CcWang, @shine715, @jiaqingTang, @aibreania
