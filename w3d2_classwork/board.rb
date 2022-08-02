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

        shuffled = @card_arr.shuffle
        @grid.map! do |row|
            row.map! do |slot|
              shuffled.pop
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

        rendered.each do |row|
            puts row.join(" ")
        end
        nil
    end

    def won?
        @grid.each do |row|
            return false if !row.all? { |card| card.face_up}
        end
        true
    end

    def reveal(pos)
        row, col = pos
        card = @grid[row][col]
        card.face_up = true
        card.face_value
    end

end

# b = Board.new
# b.populate