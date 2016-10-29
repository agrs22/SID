def polynomial(array)
	out = ''
	for i in 0..(array.length - 1)
		
		if (array.length - i) == 1 #unidades lugar c
			if i == 0
				if array[i] == 0 #if coeficient is 0 then it doesnt exit
					#do nothing
				elsif array[i] > 0 #if coeficient is greater than 1
					out = array[i].to_s
				elsif array[i] < 0
					out = array[i].to_s
				end
			else
				if array[i] == 0 #if coeficient is 0 then it doesnt exit
					#do nothing
				elsif array[i] > 0 #if coeficient is greater than 1
					out = out+' + '+array[i].to_s
				elsif array[i] < 0
					out = out+' '+array[i].to_s
				end
			end
		elsif (array.length - i) == 2 #if unidades x^1
			if i == 0
				if array[i] == 0
					#do nothing
				elsif array[i] == 1 #if coeficient is 1
					out = 'X'
				elsif array[i] > 1 #if coeficient is 1
					out = array[i].to_s+'X'
				elsif array[i] == -1 #if coeficient is 1
					out = '-X'
				elsif array[i] < -1 #if coeficient is 1
					out = array[i].to_s+'X'
				end
			else
				if array[i] == 0
					#do nothing
				elsif array[i] == 1 #if coeficient is 1
					out = out+' + X'
				elsif array[i] > 1 #if coeficient is 1
					out = out+' + '+array[i].to_s+'X'
				elsif array[i] == -1 #if coeficient is 1
					out = out+' -X'
				elsif array[i] < -1 #if coeficient is 1
					out = out+' '+array[i].to_s+'X'
				end
			end
		elsif (array.length - i) > 2 #if unidades x^2 o mas
			if i == 0
				if array[i] == 0
					#do nothing
				elsif array[i] == 1 #if coeficient is 1
					out = 'X^'+(array.length - (i+1)).to_s
				elsif array[i] > 1
					out = array[i].to_s+'X^'+(array.length - (i+1)).to_s
				elsif array[i] == -1
					out = '-X^'+(array.length - (i+1)).to_s
				elsif array[i] < -1
					out = array[i].to_s+'X^'+(array.length - (i+1)).to_s
				end
			else 
				if array[i] == 0
					#do nothing
				elsif array[i] == 1 #if coeficient is 1
					out = out+' + '+'X^'+(array.length - (i+1)).to_s
				elsif array[i] > 1
					out = out+' + '+array[i].to_s+'X^'+(array.length - (i+1)).to_s
				elsif array[i] == -1
					out = out+' '+'-X^'+(array.length - (i+1)).to_s
				elsif array[i] < -1
					out = out+' '+array[i].to_s+'X^'+(array.length - (i+1)).to_s
				end
			end
		end
	end
	return out
end
