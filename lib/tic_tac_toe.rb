require 'pry'
class TicTacToe
    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end
    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 4, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 4, 6],
        [2, 5, 8]
    ]
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
      end
      def input_to_index(input)
        @choice = input.to_i - 1
      end
      def move(index, player)
        @board[index] = player
      end
      def position_taken?(index)
        if @board[index] == "X" || @board[index] == "O"
            true
        else
            false
      end
    end
    def valid_move?(index)
        if @board[index] == " " && index <= 8 && index >= 0
            true
        else
            false 
        end
    end
    def turn_count
        @turn_counter = 0
        @board.each do |x|
            if x == "X" || x == "O"
                @turn_counter += 1 
            end
        end
        @turn_counter
    end
    def current_player
        if turn_count % 2 == 0 
            return "X"
        else
            return "O"
        end
    end
    def turn
        puts "please enter a number 1-9 in the terminal"
        @user_input = gets.chomp
        @index = input_to_index(@user_input)
        if valid_move?(@index)
            move(@index, current_player)
    else
        turn
    end
    display_board
    end
    # def won?
    #     x_counter = 0
    #     o_counter = 0
    #    if WIN_COMBINATIONS.each do |x|
    #     x.each do |y| 
    #         if @board[y] = "X" 
    #         x_counter += 1
    #         else
    #             @board[y] = "O"
    #         o_counter += 1
    #     end
    #     end
    #     if x_counter == 3 || o_counter == 3
    #        return x 
    #     else
    #         x_counter = 0 
    #         o_counter = 0
    #     end
    #     end 
    #     return false
    #    end
    #    end
    def won?
        x_counter = 0
         o_counter = 0
    if WIN_COMBINATIONS.each do |comb|
        comb.each do |index|
            if @board[index] == "X"
                x_counter += 1
            elsif @board[index] == "O"
                o_counter += 1
            end
        end

        if x_counter == 3 || o_counter == 3
            return comb
        else
            x_counter = 0
            o_counter = 0
        end
    end
    return false
end
end
def full? 
    if @board.include?(" ")
        false
    else 
        true
    end
end
def draw?
    if full? == true && won? == false
        true
    else
        false
    end
end
def over? 
    if full? == true || won? != false 
        true
    else
        false
    end
end
def winner
    if won? != false
        # binding.pry
        return @board[won?[0]]
        
    else 
        return nil
    end
end
def play    
    if over? == false && draw? == false
        turn
        play
    elsif won? != false
        puts ("Congratulations #{winner}!")
    elsif draw?
        puts ("Cat's Game!")
    end
end

end