require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "should not save game without title" do
    game = Game.new
    assert_not game.save, "Created game without title"
    assert_raises(NameError) do
      some_undefined_dude
    end
  end

  
end
