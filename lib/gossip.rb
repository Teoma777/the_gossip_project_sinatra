require 'pry'
require 'csv'

class Gossip 
	attr_accessor :author, :content
	  @@csv = './db/gossip.csv'
	  @@json = './db/gossip.json'

	def initialize(author, content)
 		 @content = content
 	 	 @author = author
	end

	def save
		 CSV.open("./db/gossip.csv", "ab") do |csv|
    	csv << [@author, @content]
      	end
      	puts '=> potin sauvegardé'
	end

	def self.all
 		 all_gossips = []
 		 CSV.read("./db/gossip.csv").each do |csv_line|
 		 all_gossips << Gossip.new(csv_line[0], csv_line[1])
  		end
  		return all_gossips
	end


end

