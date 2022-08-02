require_relative 'card'
require "byebug"


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

        @grid.map! do |row|
            row.map! do |slot|
                @card_arr.shuffle.pop
            end
        end
    end

    def fill_cards
        while @card_arr.length < 16
            pair = Card.make_pair
            @card_arr += pair
        end
    end

    def render

        rendered = @grid.map do |row|
            row.map do |card|
                card.display
            end
        end
        puts rendered
        return

        rendered.each do |row|
            puts row
        end
    end

end

# b = Board.new
# b.populate