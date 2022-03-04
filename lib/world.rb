require "cell"

class World
  attr_reader :cell_grid

  def initialize
    @cell_grid = create_empty_world
    @width = 10
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

  def create_living_cell(x, y)
    index = self.convert_grid_to_index(x, y)
    @cell_grid[index].make_alive()
  end

  def convert_grid_to_index(x, y)
    index = (y * @width ) - 1
    index += x
    return index
  end

  

end