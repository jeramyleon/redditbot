#require 'pry'
require 'httparty'

resp = HTTParty.get("http://reddit.com/r/nba/.json")

prefix = "http://reddit.com/" 

input = ARGV[0].split(/,/)
resp["data"]["children"].each do |story|
  input.each do |term|
  #  binding.pry
   if story["data"]["title"].downcase.include?(term.strip.downcase)
    puts " " 
    puts "#{term.strip.downcase} matches:"
    puts "title: " + story["data"]["title"]
    puts "url: " + story["data"]["url"]
    puts "reddit url: " + prefix +story["data"]["permalink"]
   end
  end
end
