class SudokuT
	@@board = [
		[(1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a,
		 (1..9).to_a],
		[(1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a,
		 (1..9).to_a],
		[(1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a,
		 (1..9).to_a],
		[(1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a,
		 (1..9).to_a],
		[(1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a,
		 (1..9).to_a],
		[(1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a,
		 (1..9).to_a],
		[(1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a,
		 (1..9).to_a],
		[(1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a,
		 (1..9).to_a],
		[(1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a, (1..9).to_a,
		 (1..9).to_a]
	]
	
	def initialize(input)
		@board = @@board.map { |el| el.map(&:dup) }
		@correct = !(input.length != 81 || input.match?(/\D/))
		rows = input.split(/(.{9})/).map { |s| s == '' ? s = nil : s }.compact
		rows.each.with_index do |row, row_index|
		row.chars.each.with_index do |value, col|
			insert(@board, row_index, col, value.to_i) if value != '0'
		end
		end
	end
	
	def to_s(board = @board)
		return ['incorrect input format'] unless @correct
	
		string = ''
		board.each.with_index do |row, index|
		row.each.with_index do |number, i|
			number.is_a?(Array) ? (string << ' ') : (string << number.to_s)
			((i + 1) % 3).zero? && i < 8 ? string << '|' : nil
		end
		string << if index < 8 && ((index + 1) % 3).zero?
					"\n#{'-' * 3}+#{'-' * 3}+#{'-' * 3}\n"
					else
					"\n"
					end
		end
		string
	end
	
	def solve
		return ['can\'t be solved'] unless solvable?(@board)
	
		board = collapse(@board)
		to_s(board)
	end
	
	private

	def find_empty_cells(board)
		empty_cells=[]
		board.each.with_index do |row, row_index|
			row.each.with_index do |value, column_index|
				empty_cells<<[row_index,column_index] if value.is_a?(Array)
			end
		end
		empty_cells
	end
	
	def solvable?(board)
	return false if !@correct
		(0..8).each do |row|
		return false unless correct_row(board, row)
		end
		(0..8).each do |column|
		return false unless correct_column(board, column)
		end
		(0..2).each do |row|
			(0..2).each do |column|
				(1..9).each do |num|
					return false unless correct_square(board, row * 3, column * 3, num)
				end
			end
		end
		true
	end
	
	def correct_row(board, row)
		(1..9).each do |x|
			return false if board[row].count(x) > 1
		end
		true
		end
	
		def correct_column(board, column)
		(1..9).each do |x|
			column_to_check = []
			board.each.with_index do |row, _row_index|
			column_to_check << row[column] if row[column].is_a?(Integer)
			end
			return false if column_to_check.count(x) > 1
		end
		true
		end
		def correct_square(board,row,column,num)
		x=(row/3) * 3
		y=(column/3) * 3
		square=[
			board[x][y],board[x][y+1],board[x][y+2],
			board[x+1][y],board[x+1][y+1],board[x+1][y+2],
			board[x+2][y],board[x+2][y+1],board[x+2][y+2],
		]
		square.count(num) > 1
	end
	def check_row(board, row, num)
		!board[row].include?(num)
	end
	
	def check_column(board, column,num)
		board.each do |row|
			return false if row[column] == num
		end
		true
	end
	
	def check_square(board,row,column,num)
		x=(row/3) * 3
		y=(column/3) * 3
		square=[
			board[x][y],board[x][y+1],board[x][y+2],
			board[x+1][y],board[x+1][y+1],board[x+1][y+2],
			board[x+2][y],board[x+2][y+1],board[x+2][y+2],
		]
		!square.include?(num)
	end
	def is_valid?(board,row,column,num)
		check_row(board,row,num) && check_column(board,column,num) && check_square(board,row,column,num)
	end
	def correct_square(board, row, column,num)
		x=(row/3) * 3
		y=(column/3) * 3
		square=[
			board[x][y],board[x][y+1],board[x][y+2],
			board[x+1][y],board[x+1][y+1],board[x+1][y+2],
			board[x+2][y],board[x+2][y+1],board[x+2][y+2],
		]
		return false if square.count(num) > 1
		true
	end
	
	def insert(board, row, col, value)
		return false if value.is_a?(Array)
	
		return false unless is_valid?(board,row,col,value)
		board[row][col] = value
		(0..8).each do |index|
		unless !board[row][index].is_a?(Array) || index == col
			board[row][index].delete(value)
			return false if board[row][index].empty?
		end
		unless !board[index][col].is_a?(Array) || index == row
			board[index][col].delete(value)
			return false if board[index][col].empty?
		end
		end
		(0..2).each do |r_index|
		x = (row / 3) * 3
		(0..2).each do |c_index|
			y = (col / 3) * 3
			if board[x + r_index][y + c_index].is_a?(Array)
			board[x + r_index][y + c_index].delete(value)
			return false if board[x + r_index][y + c_index].empty?
			end
		end
		end
	
		true
	end
	
	def collapse(board)
		board_copy = board.map { |el| el.map(&:dup) }
	
		contain_arrays = board.flatten(1).count { |el| el.is_a?(Array) }
		lowest_entropies = find_lowest_entropy(board)
		until lowest_entropies.empty? || contain_arrays.zero?
		x, y = lowest_entropies.pop
		value = if board[x][y].is_a?(Integer)
					board[x][y]
				else
					board[x][y].pop
				end
		board = if insert(board, x, y, value)
					collapse(board)
				else
					board_copy.map { |el| el.map(&:dup) }
				end
		contain_arrays = board.flatten(1).count { |el| el.is_a?(Array) }
		end
		board
	end
	
	def find_lowest_entropy(board)
		min_length = 10
		row_min = 0
		col_min = 0
		lowest_entropy = []
		board.each.with_index do |row, row_index|
		row.each.with_index do |value, col_index|
			next if value.class != Array
	
			if value.length < min_length
			lowest_entropy = [[row_index, col_index]]
			min_length = value.length
			row_min = row_index
			col_min = col_index
			elsif value.length == min_length
			lowest_entropy << [row_index, col_index]
			end
		end
		end
		lowest_entropy
	end
	end
 s= Sudoku.new('800020000340001000006003090002680000000009000500004160005042087420008000600100204')
   puts s