require 'rack'
require 'gossip'

	class ApplicationController < Sinatra::Base
  		get '/' do
  		erb :index, locals: {gossips: Gossip.all}
  	end

		get '/gossips/new/' do                     
		erb :new_gossip
	end

 		 post '/gossips/new/' do
  			truc_1 = params["gossip_author"]
			truc_2 = params["gossip_content"]

		Gossip.new(truc_1, truc_2).save
  		redirect '/'
	end

		get 'gossips/:id' do 
				
				 erb :show
		
#gossips.each_with_index { |val,index| puts "index: #{index} for #{val.name}"}
		end

end


