class World
  attr_reader :cells

  DEAD = 0
  ALIVE = 1

  def initialize(cells)
    @cells = cells
  end

  def tick
    next_generation = []

    @cells.count.times do
      next_generation << []
    end

    @cells.each_with_index do |cell_row, row|
      cell_row.each_with_index do |cell, column|
        neighbors = neighbors(row, column)
        living_neighbors = neighbors.count { |neighbor| neighbor == ALIVE }
        next_generation[row] << next_state(living_neighbors)
      end
    end
    @cells = next_generation
  end

  private

  def next_state(living_neighbors)
    (living_neighbors == 2 || living_neighbors == 3) ? ALIVE : DEAD
  end

  def neighbors(row, column)
    max = @cells.length - 1
    next_row = row >= max ? 0 : (row + 1)
    next_col = column >= max ? 0 : (column + 1)
    [
      # above
      @cells[row - 1][column - 1],
      @cells[row - 1][column],
      @cells[row - 1][next_col],
      # in row
      @cells[row][column - 1],
      @cells[row][next_col],
      # below
      @cells[next_row][column - 1],
      @cells[next_row][column],
      @cells[next_row][next_col]
    ]
  end
end
