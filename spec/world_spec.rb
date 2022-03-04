require 'world'

RSpec.describe World do
  DEAD = World::DEAD
  ALIVE = World::ALIVE

  describe '#tick' do
    it 'any live cell with less than two live neighbors dies' do
      initial_cells = [
        [DEAD, DEAD, DEAD],
        [DEAD, ALIVE, DEAD],
        [DEAD, DEAD, DEAD]
      ]

      world = World.new(initial_cells)
      world.tick
      expect(world.cells[1][1]).to eq(DEAD)
    end

    it 'any live cell with 2 or 3 live neighbors lives' do
      initial_cells = [
        [DEAD, DEAD, DEAD],
        [ALIVE, ALIVE, ALIVE],
        [DEAD, DEAD, DEAD]
      ]

      world = World.new(initial_cells)
      world.tick
      expect(world.cells[1][1]).to eq(ALIVE)
    end

    it 'any live cell with more than 3 live neighbors dies' do
      initial_cells = [
        [ALIVE, DEAD, DEAD],
        [ALIVE, ALIVE, DEAD],
        [ALIVE, ALIVE, DEAD]
      ]

      world = World.new(initial_cells)
      world.tick
      expect(world.cells[1][1]).to eq(DEAD)
    end

    it 'any dead cell with exactly 3 live neighbors lives' do
      initial_cells = [
        [ALIVE, ALIVE, DEAD],
        [ALIVE, DEAD, DEAD],
        [DEAD, DEAD, DEAD]
      ]

      world = World.new(initial_cells)
      world.tick
      expect(world.cells[1][1]).to eq(ALIVE)
    end
  end
end
