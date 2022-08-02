require_relative 'card'

class Board

    def initialize
        @grid = Array.new(4) {Array.new(4, " ") }
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

    def empty?(pos)
        self[pos] == " "
    end

    def populate
        fill_cards
        indices = (0..3).to_a

        num_filled = 0
        while num_filled > @card_arr.length
            @card_arr.each do |card|
                row = indices.sample
                col = indices.sample
                pos = [row, col]
                if empty?(pos)
                    self[pos] = card
                    num_filled += 1
                end
            end
        end
    end

    def fill_cards
        while @card_arr.length < 16
            pair = Card.make_pair
            @card_arr += pair
        end
    end



end