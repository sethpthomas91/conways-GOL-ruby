require 'cell'

describe "Cell" do
  it "should create a cell that is not alive" do
    cell = Cell.new
    expect(cell.is_alive).to eq(false)
  end
end

describe "Cell.make_alive" do
  it "should turn a cell's state to alive" do
    cell = Cell.new
    cell.make_alive
    expect(cell.is_alive).to eq(true)
  end
end

describe "Cell.kill" do
  it "should turn a cell's state to not alive" do
    cell = Cell.new
    cell.make_alive
    cell.kill
    expect(cell.is_alive).to eq(false)
  end
end