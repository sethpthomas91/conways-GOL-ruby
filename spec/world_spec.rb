require 'world'

describe "World" do
  it "should create a world with no living cells" do
    world = World.new
    expect(world.is_empty).to eq(true)
  end
end

describe "World.create_living_cell_at" do
  it "should create a world that has a living cell" do
    world = World.new
    world.create_living_cell_at(0,0)
    expect(world.is_empty).to eq(false)
  end
end

describe "World.is_living_at" do
  it "should create a world that has a living cell at a specified coordinate" do
    world = World.new
    world.create_living_cell_at(1,1)
    expect(world.is_living_at(1,1)).to eq(true)
  end
end

describe "World.create_array_of_neighbors" do
  it "should create an array of indexes that are neighbors to the indicated index" do
    world = World.new
    neighbor_arr = world.create_array_of_neighbors(11)
    output = [
      0, 1, 2, 10, 12, 20, 21, 22
    ]
    expect(neighbor_arr).to eq(output)
  end
end

describe "World.is_top_row" do
  it "should indicate that an index is in the top row" do
    world = World.new
    index = 0 
    expect(world.is_top_row(index)).to eq(true)
  end
end

describe "World.convert_index_to_grid" do
  it "should convert index 2 to grid [2,0]" do
    world = World.new
    input = world.convert_index_to_grid(2)
    output = [2 , 0]
    expect(input).to eq(output)
  end
end

describe "World.convert_index_to_grid" do
  it "should convert index 0 to grid [0,0]" do
    world = World.new
    input = world.convert_index_to_grid(0)
    output = [0 , 0]
    expect(input).to eq(output)
  end
end

describe "World.convert_index_to_grid" do
  it "should convert index 9 to grid [9, 0]" do
    world = World.new
    input = world.convert_index_to_grid(9)
    output = [9 , 0]
    expect(input).to eq(output)
  end
end

describe "World.convert_index_to_grid" do
  it "should convert index 18 to grid [8, 1]" do
    world = World.new
    input = world.convert_index_to_grid(18)
    output = [8 , 1]
    expect(input).to eq(output)
  end
end

describe "World.convert_index_to_grid" do
  it "should convert index 19 to grid [9, 1]" do
    world = World.new
    input = world.convert_index_to_grid(19)
    output = [9 , 1]
    expect(input).to eq(output)
  end
end

describe "World.convert_grid_to_index" do
  it "should convert grid [9, 0] to index 9" do
    world = World.new
    input = world.convert_grid_to_index(9, 0)
    output = 9
    expect(input).to eq(output)
  end
end

describe "World.convert_grid_to_index" do
  it "should convert grid [8, 1] to index 18" do
    world = World.new
    input = world.convert_grid_to_index(8, 1)
    output = 18
    expect(input).to eq(output)
  end
end

describe "World.is_bottom_row" do
  it "should indicate that an index is in the bottom row" do
    world = World.new
    index = 99 
    expect(world.is_bottom_row(index)).to eq(true)
  end
end

describe "World.create_array_of_neighbors" do
  it "should create an array of indexes for a cell on the top row" do
    world = World.new
    neighbor_arr = world.create_array_of_neighbors(0)
    output = [
     1, 10, 11
    ]
    expect(neighbor_arr).to eq(output)
  end
end

describe "World.is_left_row" do
  it "should return true if the index given is an index for the left row" do
    world = World.new
    neighbor_arr = world.is_left_row(0)
    output = true
    expect(neighbor_arr).to eq(output)
  end
end

describe "World.is_left_row" do
  it "should return false if the index given is not an index in the left row" do
    world = World.new
    neighbor_arr = world.is_left_row(2)
    output = false
    expect(neighbor_arr).to eq(output)
  end
end

describe "World.is_right_row" do
  it "should return true if the index given is an index for the right row" do
    world = World.new
    neighbor_arr = world.is_right_row(9)
    output = true
    expect(neighbor_arr).to eq(output)
  end
end

describe "World.is_right_row" do
  it "should return false if the index given is an index not for the right row" do
    world = World.new
    neighbor_arr = world.is_right_row(15)
    output = false
    expect(neighbor_arr).to eq(output)
  end
end