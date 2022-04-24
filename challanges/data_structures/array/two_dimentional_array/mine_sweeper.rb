# frozen_string_literal: true

def mine_sweeper(bombs, num_rows, num_cols)
  field = Array.new(num_cols) { Array.new(num_rows) { 0 } }

  bombs.each do |bomb|
    posX = bomb[0]
    posY = bomb[1]

    i = posX - 1
    y = posY - 1
    field[posX][posY] = -1
    while i <= posX + 1
      while y <= posY + 1
        field[i][y] += 1 if i >= 0 && y >= 0 && field[i][y] != -1
        print field
        i += 1
        y += 1
      end
    end
  end

  field
end
bombs = []
bombs << [0, 1]
bombs << [0, 0]
mine_sweeper(bombs, 3, 3)
