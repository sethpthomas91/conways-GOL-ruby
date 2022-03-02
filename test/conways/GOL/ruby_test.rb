require "test_helper"

class Conways::GOL::RubyTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Conways::GOL::Ruby::VERSION
  end

  def test_a_new_world_is_empty
    world = World.new
    assert_true world.empty?
  end
end
