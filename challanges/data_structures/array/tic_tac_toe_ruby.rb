GAME_BOARD = [
  ["x", "x", "o"],
  ["", "o", ""],
  ["o", "o", ""],
]

GAME_BOARD_RANDOM = [
  ["", "", ""],
  ["", "", ""],
  ["", "", ""],
]

GAME_BOARD_RANDOM.map do |line|
  i = 0
  while(i <= line.size - 1)
    line[i] = Random.rand(10) >= 5 ? 'x' : 'o'
    i += 1
  end
end

def check_game(board)
  i = 0
  while(i <= board.size - 1)
    if(board[i][0] != "" && board[i][0] === board[i][1] && board[i][1] === board[i][2])
      return "#{board[i][0]} is a line winner"
    elsif(board[0][i] != "" && board[0][i] === board[1][i] && board[1][i] === board[2][i])
      return "#{board[0][i]} is a column winner"
    end

    i += 1
  end

  if(board[0][0] != "" && board[0][0] === board[1][1] && board[1][1] === board[2][2])
    return "#{board[1][1]} is a diagonal winner"
  elsif(board[0][2] != "" && board[0][2] === board[1][1] && board[1][1] === board[2][0])
    return "#{board[1][1]} is a diagonal winner"
  end
end

check_game GAME_BOARD_RANDOM
