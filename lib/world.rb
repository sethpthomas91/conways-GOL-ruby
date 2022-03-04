require "cell"

class World
  attr_reader :cell_grid, :width

  def initialize
    @cell_grid = create_empty_world
    @width = 10
  end

  def create_empty_world
    new_cell_grid = []
    width = 10
    while new_cell_grid.length < width**2
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

  def create_living_cell_at(x, y)
    index = self.convert_grid_to_index(x, y)
    @cell_grid[index].make_alive
  end

  def convert_grid_to_index(x, y)
    index = (y * @width )
    index += x
    return index
  end

  def convert_index_to_grid(index)
    x = index % @width
    y = (index / @width)
    return [x, y]
  end

  def is_living_at(x,y)
    index = self.convert_grid_to_index(x, y)
    @cell_grid[index].is_alive
  end

  def create_array_of_neighbors(index)
    # so this is a terrible function. Way too long and does far too many things.
    neighbor_arr = []
    is_top_row = is_top_row(index)
    is_left_row = is_left_row(index)
    is_right_row = is_right_row(index)
    is_bottom_row = is_bottom_row(index)
    is_top_left = index == 0
    is_top_right = index == @width - 1
    is_bottom_left = is_bottom_row == true and is_left_row == true
    is_bottom_right = is_bottom_row == true and is_right_row == true
    is_middle = is_top_row == false and is_bottom_row == false and is_left_row == false and is_right_row == false
    if is_middle 
      neighbor_arr << index - @width - 1
      neighbor_arr << index - @width
      neighbor_arr << index - @width + 1
      neighbor_arr << index - 1
      neighbor_arr << index + 1
      neighbor_arr << index + @width - 1
      neighbor_arr << index + @width
      neighbor_arr << index + @width + 1
    elsif is_top_left
      neighbor_arr << index + 1
      neighbor_arr << index + @width
      neighbor_arr << index + @width + 1
    elsif is_top_right
      neighbor_arr << index - 1
      neighbor_arr << index + @width - 1
      neighbor_arr << index + @width
    end
  end

  def is_top_row(index)
    if index - @width < 0
        return true
    else
        return false
    end
  end

  def is_bottom_row(index)
    if index + @width > @width**2
        return true
    else
        return false
    end
  end

  def is_left_row(index)
    x = self.convert_index_to_grid(index)[0]
    if x - 1 < 0 
      return true
    else
      return false
    end
  end

  def is_right_row(index)
    x = self.convert_index_to_grid(index)[0]
    if x + 1 >= @width
      return true
    else
      return false
    end
  end


end