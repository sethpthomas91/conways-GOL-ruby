class Cell
    attr_reader :is_alive

    def initialize
        @is_alive = false
    end

    def make_cell_alive
        @is_alive = true
    end


end