require_relative 'card'

class Board

    def initialize(size)
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

    def empty?(pos)
        @grid[pos] == " "
    end

    def populate
        fill_cards
        indices = (0..3).to_a
        card_arr.each do |card|
            row = indices.sample
            col = indices.sample
            pos = [row, col]
            @grid[pos] = card if empty?(pos)
        end
    end

    def fill_cards
        while @card_arr.length < 16
            pair = Card.make_pair
            @card_arr += pair
        end
        @card_arr.each { |card| p card.face_value}
    end



end