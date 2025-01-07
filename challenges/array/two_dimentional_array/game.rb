class Game
  attr_accessor :board
  attr_reader :placeholder

  def initialize(placeholder = " ")
    @placeholder = placeholder
    @board       = build_board
    @won         = false
  end

  def restart_game
    @won = false
    build_board
  end

  def play(player, column_index)
    if won
      puts "cannot play anymore, this game has already finished"
      return
    end

    board.reverse.each.with_index do |row, row_index|
      reverse_row_index = (board.length - 1) - row_index
      if row[column_index] == placeholder
        board[reverse_row_index][column_index] = player

        print_board

        if check_winner(player, reverse_row_index, column_index)
          @won = true
        end

        return
      end
    end

    puts "player #{player} cannot play on column #{column_index}"
  end

  def check_winner(player, row_index, column_index)
    count = 0

    #
    # NOTE: check row win
    #
    board[row_index].each do |cell|
      if cell == player
        count += 1

        if count == 4
          puts "player #{player} wins!"
          return true
        end
      else
        count = 0
      end
    end

    count = 0

    #
    # NOTE: check column win
    #
    board.each do |row|
      if row[column_index] == player
        count += 1

        if count == 4
          puts "player #{player} wins!"
          return true
        end
      end
    end

    #
    # NOTE: check diagonal win
    #
    # TODO

    false
  end

  def print_board
    puts "-----------------"
    board.each do |row|
      print row
      puts placeholder
    end
  end

  private

  attr_accessor :won

  def build_board
    @board = [
      [placeholder, placeholder, placeholder, placeholder, placeholder, placeholder],
      [placeholder, placeholder, placeholder, placeholder, placeholder, placeholder],
      [placeholder, placeholder, placeholder, placeholder, placeholder, placeholder],
      [placeholder, placeholder, placeholder, placeholder, placeholder, placeholder],
      [placeholder, placeholder, placeholder, placeholder, placeholder, placeholder],
      [placeholder, placeholder, placeholder, placeholder, placeholder, placeholder],
      [placeholder, placeholder, placeholder, placeholder, placeholder, placeholder],
    ]
  end
end

game = Game.new
# game_one = [
#   ["x", 0],
#   ["o", 0],
#   ["x", 1],
#   ["o", 1],
#   ["x", 2],
#   ["o", 2],
#   ["x", 3],
#   ["o", 3],
# ]

# game_one.each do |player, column_index|
#   game.play(player, column_index)
# end

game_two = [
  ["o", 0],
  ["x", 0],
  ["o", 1],
  ["x", 0],
  ["o", 1],
  ["x", 0],
  ["o", 1],
  ["x", 0],
]

game_two.each do |player, column_index|
  game.play(player, column_index)
end