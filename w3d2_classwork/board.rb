require_relative 'card'

class Board

    def initiliaze(size)
        @size = size
        @grid = Array.new(@size) {Array.new(@size, " ") }
        @card_arr = []
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def populate


    end


end