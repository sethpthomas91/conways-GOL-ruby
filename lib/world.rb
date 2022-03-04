require "cell"

class World
    attr_reader :cell_grid

    def initialize
        @cell_grid = create_empty_world
    end

    def create_empty_world
        new_cell_grid = []
        width = 10
        while new_cell_grid.length() < width**2
            new_cell_grid << Cell.new
        end
        @cell_grid = new_cell_grid
    end

    def is_empty
        for cell in @cell_grid do
            if cell.is_alive === true
                return false
            end
        end
        return true
    end


end