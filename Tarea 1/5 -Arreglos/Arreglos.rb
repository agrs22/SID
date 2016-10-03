load 'table.rb'
class Get
	def self.champ(db)	
		for i in 0..(db.length - 1)
			if db[i][0] == 1
				return db[i][1]
			end
		end
	end
	
	def self.uefa(db)	
		uefadb = ['','','']
		for i in 0..(db.length - 1)
			if db[i][0] == (1)
				uefadb[0] = db[i][1]
			elsif db[i][0] == (2)
				uefadb[1] = db[i][1]
			elsif db[i][0] == (3)
				uefadb[2] = db[i][1]
			end
		end
		return uefadb
	end
	def self.decending(db)	
		decendingdb = [0,0,0]
		for i in 0..(db.length - 1)
			if db[i][0] == (20)
				decendingdb[0] = db[i][1]
			elsif db[i][0] == (19)
				decendingdb[1] = db[i][1]
			elsif db[i][0] == (18)
				decendingdb[2] = db[i][1]
			end
		end
		return decendingdb
	end
end
class Sortdb
	GF = Hash.new
	GC = Hash.new
	DG = Hash.new
	PG = Hash.new
	PE = Hash.new
	PP = Hash.new
	def self.sortgf(db)
		for i in 0..(db.length-1)
			GF[(db[i][7])] = (db[i][1])
		end
		return Hash[GF.sort_by{|k,v| k}.reverse].values
	end
	
	def self.sortgc(db)
		for i in 0..(db.length-1)
			GC[(db[i][8])] = (db[i][1])
		end
		return Hash[GC.sort_by{|k,v| k}.reverse].values
	end
	
	def self.sortdg(db)
		for i in 0..(db.length-1)
			DG[((db[i][7]).to_i - (db[i][8]).to_i)] = (db[i][1])
		end
		return Hash[DG.sort_by{|k,v| k}.reverse].values
	end
	def self.sortpg(db)
		for i in 0..(db.length-1)
			PG[(db[i][4])] = (db[i][1])
		end
		return Hash[PG.sort_by{|k,v| k}.reverse].values
	end
	def self.sortpe(db)
		for i in 0..(db.length-1)
			PE[(db[i][5])] = (db[i][1])
		end
		return Hash[PE.sort_by{|k,v| k}.reverse].values
	end
	def self.sortpp(db)
		for i in 0..(db.length-1)
			PP[(db[i][6])] = (db[i][1])
		end
		return Hash[PP.sort_by{|k,v| k}.reverse].values
	end
end
puts '**Campeon**'
p Get.champ(@db123)
puts '**Clasificados UEFA**'
p Get.uefa(@db123)
puts '**Decienden**'
p Get.decending(@db123)
puts '**Sort by GF**'
p Sortdb.sortgf(@db123)
puts '**Sort by GC**'
p Sortdb.sortgc(@db123)
puts '**Sort by DG**'
p Sortdb.sortdg(@db123)
puts '**Sort by PG**'
p Sortdb.sortpg(@db123)
puts '**Sort by PE**'
p Sortdb.sortpe(@db123)
puts '**Sort by PP**'
p Sortdb.sortpp(@db123)