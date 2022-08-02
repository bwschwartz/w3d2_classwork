class Card

    def self.make_pair
        alpha = ("a".."z").to_a
        value = ""
        3.times { value << alpha.sample }
        2.times { Card.new(value) }

    end

    attr_reader :face_value :face_value

    def initiliaze(face_value)
        @face_value = face_value
        @face_up? = false


    end

    def display
        @face_value if @face_up?

    end

    def hide
        @face_up? = false
    end

    def reveal
        @face_up? = true
    end

    def ==(card)
        @face_value == card.face_value
    end

end
