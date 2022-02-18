class TicTacToe
	def initialize 
		@board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
	end 

	WIN_COMBINATIONS = [
		[0,1,2],
		[3,4,5],
		[6,7,8],
		[0,3,6], 
		[1,4,7], 
		[2,5,8],
		[0,4,8],
		[6,4,2]
	]

	def display_board
		puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
		puts "-----------"
		puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
		puts "-----------"
		puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
	end

	def move(position, current_player = "X")
		@board[position] = current_player 
	end

	def input_to_index(user_input)
		user_input.to_i - 1
	end

	def position_taken?(position)
		@board[position] != " "
	end 

	def valid_move?(index)
		@board[index]&.strip == "" && index.between?(0, 8)
	end 

	def turn
		puts "Please enter 1-9:"
		input = gets.strip
		index = input_to_index(input)
		if valid_move?(index)
		    thing = current_player
		    move(index, thing)
		else
		    turn
		end
		display_board
	    end
	    
	    def won?
		WIN_COMBINATIONS.each do | combinations |
		    if combinations.all? {|combination| combination == "X" || combination == "O"}
		    combinations
		    else 
			false 
		    end 
		end 
	end 

	def turn_count
		@board.count{|square| square != " "}
	end 

	def current_player
		turn_count.even? ? "X" : "O"
	end 

	def won?
		WIN_COMBINATIONS.any? do | combinations |
		    if position_taken?(combinations[0]) && @board[combinations[0]] == @board[combinations[1]] && @board[combinations[1]] == @board[combinations[2]]
			return combinations
		    end 
		end 
	end 

	def full?
		@board.all?{|square| square != " "}	
	end 

	def draw? 
		full? && !won?
	end 

	def over?
		won? || draw?
	end 

	def winner
		if combination = won?
			@board[combination[0]]
		end 
	end 

	def play 
		turn until over? 
		puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
	end 

end 