require 'cell'

RSpec.describe Cell, "#isalive"  do
    context "upon creation of a new instance of a cell" do
        it "indicates that the cell is not alive" do
            cell = Cell.new
            expect(cell.is_alive).to eq(false)
        end
    end

    context "upon creation of a new instance of a cell" do
        it "cell living state can be changed to alive" do
            cell = Cell.new
            cell.make_alive
            expect(cell.is_alive).to eq(true)
        end
    end

    context "upon creation of a new instance of a cell" do
        it "cell living state can be changed to alive and back to dead" do
            cell = Cell.new
            cell.make_alive
            cell.kill
            expect(cell.is_alive).to eq(false)
        end
    end
end