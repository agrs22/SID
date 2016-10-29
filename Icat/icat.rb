require "net/http"
require "uri"
require 'json'
require 'time'

class GetPCC
	@apisite = 'http://icat2013.herokuapp.com'
	@activitycounts = 'activity_counts/query'
	@sleepscore = 'activity_counts/query_sleep_score'
	@calories = 'activity_counts/query_calories'
	@arrayactivity = Array.new
	@arraysleep = Array.new
	
	def self.setbundle(user,start_t,end_t)
		@bundle = {"api_key": "iCAT-ti2013","users":[{"username": user}],"start_date":start_t,"end_date":end_t,"compute_bouts": 1}
	end
  
	def self.encode_path_params(path, params)
		encoded = URI::encode(params)
		[path, encoded].join("?bundle=")
	end

	def self.getreq(type)
		request = encode_path_params(type,@bundle.to_json)
		url = URI.parse([@apisite,request].join('/'))
		uri = URI(url)
		response = Net::HTTP.get(uri)
		out = JSON.parse(response)
		return out
	end

	def self.get_counts
		input = getreq(@calories)
		return input['avg_calories'].to_i
	end
	
	def self.get_sleeps
		a = getreq(@sleepscore)
		ast = a['avg_asleep_time'].to_f
		aa = a['avg_awakenings'].to_f
		aat = a['avg_awakening_time'].to_f
		if ast == 0
			return 0
		else
			out = (ast-(aa*aat))/ast
			return out
		end
		
	end
	
	def self.ruby_pearson(x,y)
		n=x.length

		sumx=x.inject(0) {|r,i| r + i}
		sumy=y.inject(0) {|r,i| r + i}

		sumxSq=x.inject(0) {|r,i| r + i**2}
		sumySq=y.inject(0) {|r,i| r + i**2}

		prods=[]; x.each_with_index{|this_x,i| prods << this_x*y[i]}
		pSum=prods.inject(0){|r,i| r + i}

		# Calculate Pearson score
		num=pSum-(sumx*sumy/n)
		den=((sumxSq-(sumx**2)/n)*(sumySq-(sumy**2)/n))**0.5
		if den==0
			return 0
		end
		r=num/den
		return r
	end
	
	def self.calculate(user,start_t,end_t)
		@arrayactivity.clear
		@arraysleep.clear
		de = Time.parse(start_t).to_i
		a = Time.parse(end_t).to_i
		while de < a
			setbundle(user,Time.at(de),Time.at(de + 86400))
			if get_counts > 0
				@arrayactivity.push(get_counts)
			end
			if get_sleeps > 0
				@arraysleep.push(get_sleeps)
			end
			de = de + 86400
		end
		ruby_pearson(@arrayactivity,@arraysleep)
	end
end
#########################################################################################################
#																										#
# Example of usage: 																					#
# load icat.rb																							#
# GetPCC.calculate('b4:07:f9:f5:2c:10','2013-06-06 20:15:00','2013-06-10 00:00:00')						#
#																										#
#########################################################################################################