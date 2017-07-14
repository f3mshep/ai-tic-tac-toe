class Board

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]

  def initialize(board = nil)
    @board = ["1","2","3","4","5","6","7","8","9"] || board
    @turns = 1
    puts "To make a move, please enter a number that corresponds with a number on the grid"
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  def input
    gets.chomp.to_i - 1
  end

  def empty?
    if @board[@input] == "X" || @board[@input] == "O"
      false
    else
      true
    end
  end

  def valid_move?
    if (@input > 0 || @input < 10) && empty?
      true
    else
      false
    end
  end

  def add_token
    @board[@input] = current_player
  end

  def current_player
    if @turns % 2 == 0
      "O"
    else
      "X"
    end
  end

  def state_checker

    if @board.all? { |e| e == "X" || e == "O"  }
      puts "Cat's game!"
      display_board
      exit
    end

    WIN_COMBINATIONS.each do |combo|
      if combo.all? { |e| @board[e] == "X"  }
        puts "X Wins!!"
        display_board
        exit
      elsif combo.all? { |e| @board[e] == "O"  }
        puts "O Wins!!"
        display_board
        exit
      end
    end

  end

  def play
    puts "\n"
    display_board
    puts "\nIt is your turn, #{current_player}"
    @input = input
    if valid_move?
      add_token
    else
      puts "Please enter a valid move"
      play
    end
    state_checker
    @turns += 1
    play
  end

  def play_ai
    puts "\n"
    display_board
    if current_player == "X"
      puts "\nIt is your turn, #{current_player}"
      @input = input
      if valid_move?
        add_token
      else
        puts "Please enter a valid move"
        play_ai
      end
    else
      @input = rand(1..9) -1
      until valid_move?
        @input = rand(1..9) - 1
      end
      add_token
    end

    state_checker
    @turns += 1
    play_ai
  end
end
