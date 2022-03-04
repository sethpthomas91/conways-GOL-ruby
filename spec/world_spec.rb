require 'world'

RSpec.describe World, "#cell_grid"  do
  context "upon creation of the world" do
    it "indicates that there are no living cells" do
      world = World.new
      expect(world.is_empty).to eq(true)
    end
  end

  context "upon specifying a new living cell cell" do
    it "indicates that there are living cells in the grid" do
      world = World.new
        world.create_living_cell(0,0)
          expect(world.is_empty).to eq(false)
    end
  end
end
