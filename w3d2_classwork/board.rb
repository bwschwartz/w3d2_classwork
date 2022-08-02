require_relative 'card'

class Board

    def initiliaze(size)
        @size = 4
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

    def fill_cards
        while card_arr.length < 16
            pair = Card.make_pair

        end

    end



end