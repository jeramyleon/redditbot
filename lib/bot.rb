require 'httparty'
require 'pry'
require 'json'

class Bot

  include HTTParty

  def initialize(settings)
    @settings = settings
  end

  def search
    @settings["sub-reddits"].each do |key, val|
      puts "In #{key} sub-reddit looking for terms #{val["terms"]}:"
      reddit_data = self.class.get(val["url"])
      reddit_data["data"]["children"].each do |story|
        val["terms"].split(/,/).each do |term|
          if story["data"]["title"].downcase.include?(term.strip.downcase)
            puts " "
            puts "#{term.strip.downcase} matches:"
            puts "title: " + story["data"]["title"]
            puts "url: " + story["data"]["url"]
            puts "reddit url: " + prefix + story["data"]["permalink"]
          end
        end
      end
    end
  end

end

#JSON.parse turns settings.json into a hash if its a hash and array if its an array
settings = JSON.parse(File.read("settings.json"))

@bot = Bot.new(settings)
@bot.search
