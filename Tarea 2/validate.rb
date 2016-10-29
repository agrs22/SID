class Validate
	
	def self.user(username)
		(not /\W/ === username) and username.length < 20
	end
	def self.password(pass)
		(not /\W/ === pass) and pass.length > 6 and pass.length < 20
	end
	def self.email(address)
		/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i === address
	end
	def self.phone(number)
		/\A\(\d{3}\)\s\d{3}-\d{2}-\d{2}\z/i === number
	end
	def self.all(userdata)
		results = ['','','','']
		results[0] = user(userdata[0]) 
		results[1] = password(userdata[1]) 
		results[2] = email(userdata[2])
		results[3] = phone(userdata[3])
		p results
	end
end