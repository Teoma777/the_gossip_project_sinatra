require 'pry'
require 'csv'

class Gossip 
	attr_accessor :author, :content, :id
	  @@csv = './db/gossip.csv'
	  @@json = './db/gossip.json'

	def initialize(author, content, id=1)
 		 @content = content
 	 	 @author = author
 	 	 @id = id
 	 	 
	end

	def save
		 CSV.open("./db/gossip.csv", "ab") do |csv|
    	csv << [@author, @content]
      	end
      	puts '=> potin sauvegardé'
	end

	def self.all
 		 all_gossips = []
 			CSV.read("./db/gossip.csv").each.with_index do |csv_line, index|
 		 all_gossips << Gossip.new(csv_line[0], csv_line[1], index)
  		end
  		return all_gossips
	end


	def self.find(x) # x est le numéro du gossip
		#puts "recherche de #{x} en cours"
		#
		show = []
			Gossip.all.each do |gossip, id|
				if  x == gossip.id then
								#  "MATCH ! "
					show << gossip.author
					show << gossip.content

				return show
			end
		end
	end

end

