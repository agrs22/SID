class Location
	def initialize(name, lat, long)
		@name = name
		@lat = lat
		@long = long
	end
	def inspect
		miarray = @name,@lat, @long
		miarray
	end	
	def to_array
    [] << @name << @lat << @long
  end
end
def distance(l1, l2)
	loc1 = [l1.to_array[1],l1.to_array[2]]
	loc2 = [l2.to_array[1],l2.to_array[2]]
	rad_per_deg = Math::PI/180  # PI / 180
	rkm = 6371                  # Earth radius in kilometers
	rm = rkm * 1000             # Radius in meters

	dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg  # Delta, converted to rad
	dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg

	lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
	lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

	a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
	c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

	distance_m = rm * c # Delta in meters
	return distance_m.to_i
end
def inside?(l1,l2,r)
	distance_m = distance(l1,l2)
	if r < distance_m
		return false
	else 
		return true
	end
end
def where?(l1,ls,r)
	sd = (2**(0.size * 8 -2) -1)
	si = 0
	for i in 0..(ls.length - 1)
		distance_m = distance(l1,ls[i])
		if 0 < distance_m and distance_m < sd
			si = i
		end	
	end
	return ls[si].to_array[0]
end