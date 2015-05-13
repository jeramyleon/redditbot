#require 'pry'
require 'httparty'

resp = HTTParty.get("http://reddit.com/r/nba/.json")
input = ARGV[0].split(/,/)

class Bot

def initialize(input,data)
  @input = input
  @data  = data
end

prefix = "http://reddit.com/" 

attr_accessor :resp
attr_accessor :input
attr_accessor :prefix

def search(input,resp)

resp["data"]["children"].each do |story|
  input.each do |term|
  #  binding.pry
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

redditbot = Bot.new
print "What would you like to search?"
user_input = gets.chomp
redditbot.search(user_input)


 
