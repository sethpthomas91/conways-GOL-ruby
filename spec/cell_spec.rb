require 'cell'

RSpec.describe Cell, "#isalive"  do
    context "upon creation of a new instance of a cell" do
        it "indicates that the cell is not alive" do
            cell = Cell.new
            expect(cell.is_alive).to eq(false)
        end
    end
end