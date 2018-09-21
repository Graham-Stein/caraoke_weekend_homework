require("minitest/autorun")
require("minitest/rg")
require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../song.rb")

class TestRoom < MiniTest::Test

  def setup()
    @pear_tree = Room.new("Pear Tree Upstairs", 10)

    @punter1 = Guest.new("Mike Tyson")
    @punter2 = Guest.new("Guy Wimble", 20)
    
    @alabama3 = Song.new("12 Step Plan")
  end

  def test_room_has_name
    assert_equal("Pear Tree Upstairs", @pear_tree.room_name)
  end

  def test_room_has_spaces
    assert_equal(10, @pear_tree.spaces)
  end

  def test_room_has_empty_guest_list
    assert_equal([], @pear_tree.guest_list)
  end

  def test_room_has_empty_play_list
    assert_equal([], @pear_tree.play_list)
  end

  def test_check_in_one_guest
    @pear_tree.check_in_guest(@punter1)
    assert_equal([@punter1], @pear_tree.guest_list)
  end

  def test_add_one_song_to_list
    @pear_tree.add_song(@alabama3)
    assert_equal([@alabama3], @pear_tree.play_list)
  end

end
