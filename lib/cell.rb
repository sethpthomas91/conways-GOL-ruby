class Cell
    attr_reader :is_alive

    def initialize
        @is_alive = false
    end

    def make_alive
        @is_alive = true
    end

    def kill
        @is_alive = false
    end
end