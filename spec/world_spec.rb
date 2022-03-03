require 'world'

RSpec.describe World, "#cell_grid"  do
    context "upon creation of the world" do
        it "indicates that there are no living cells" do
            world = World.new
            expect(world.is_empty).to eq(true)
        end
    end
end