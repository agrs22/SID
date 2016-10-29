class Hangman
	def initialize(word, hint)
		@word = word.downcase
		@hint = hint
		@chances = 9
		@guessed = ''
		@won = false
		system 'cls'
	end
	def inspect
		"A new game was started"
		info
	end	
	def patterngen
		repat = /[^#{Regexp.quote(@guessed)}\s]/
		@pattern = @word.gsub(repat, '_')
		puts @pattern
	end
	def info
		mistake
		patterngen
	end
	def guess(letter)
		#checks if there is any tries left if so runs the guess otherwise calls mistake
		if @won
			puts 'Please start a new game'
		elsif @chances > 0
			# checks if it's a single letter guess or if you are trying to guess the whole phrase
			if letter.length > 1
				if letter.downcase == @word
					win
				elsif letter.length == (@word.length - 1)
					puts 'Incorrect Length'
				else
					@chances = @chances - 1
					mistake
				end
			# guess was only one letter 	
			else
				if @word.include? letter.downcase
					@guessed = @guessed + letter.downcase
					puts 'good guess'
					info
					if @pattern == @word
						win
					end
				else
					puts 'bad guess'
					@chances = @chances - 1
					mistake
				end
			end
		else
			mistake
		end
	end
	def mistake
		system 'cls'
		if @chances == 9
			puts   ""
			puts   '            '
			puts   '   		'
			puts   '   		'
			puts   '   		'
			puts   '    		'
			puts   '    		'
			puts   ''
			puts "9 Tries left"
		end
		if @chances == 8
			puts   ""
			puts   '            '
			puts   '   		'
			puts   '   		'
			puts   '   		'
			puts   '    		'
			puts   '    		'
			puts   '-+----------'
			puts "8 Tries left"
		end
		if @chances == 7
			puts   ""
			puts   '            '
			puts   '   		'
			puts   '   		'
			puts   '   		'
			puts   '    		'
			puts   ' |   		'
			puts   '-+----------'
			puts   "7 Tries left"
		end
		if @chances == 6
			puts   ""
			puts   '            '
			puts   '    		'
			puts   '    		'
			puts   '     		'
			puts   ' |   		'
			puts   ' |   		'
			puts   '-+----------'
			puts   "6 Tries left"
		end
		if @chances == 5
			puts   ""
			puts   '            '
			puts   '    		'
			puts   '    		'
			puts   ' |  		'
			puts   ' |   		'
			puts   ' |   		'
			puts   '-+----------'
			puts   "5 Tries left"
		end
		if @chances == 4
			puts   ""
			puts   '            '
			puts   ' |   		'
			puts   ' |  		'
			puts   ' |  		'
			puts   ' |   		'
			puts   ' |   		'
			puts   '-+----------'
			puts   "4 Tries left"
		end
		if @chances == 3
			puts   ""
			puts   ' +---+-     '
			puts   ' |   		'
			puts   ' |   		'
			puts   ' |  		'
			puts   ' |   		'
			puts   ' |   		'
			puts   '-+----------'
			puts   "3 Tries left"
		end
		if @chances == 2
			puts   ""
			puts   ' +---+-     '
			puts   ' |   |		'
			puts   ' |   		'
			puts   ' |  		'
			puts   ' |   		'
			puts   ' |   []		'
			puts   '-+----------'
			puts   "2 Tries left"
		end
		if @chances == 1
			puts   ""
			puts   ' +---+-     '
			puts   ' |   |		'
			puts   ' |   O		'
			puts   ' |  /|\		'
			puts   ' |   |\		'
			puts   ' |   []		'
			puts   '-+----------'
			puts   "1 Try left"
		end
		if @chances == 0
			puts   ""
			puts   ' +---+-     '
			puts   ' |   |		'
			puts   ' |   O		'
			puts   ' |  /|\		'
			puts   ' |   |\		'
			puts   ' |   		'
			puts   '-+----------'
			puts   "You are Hanged please start a new game!"
		end
		
	end
	def win
			system 'cls'
			@won = true
			puts   ""
			puts   '            '
			puts   '   		'
			puts   '   		'
			puts   '     O/	    '
			puts   '    /|		'
			puts   '     |\		'
			puts   '------------'
			puts "You won the game!"
	end	
	
end