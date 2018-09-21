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
    @guest_list = [@punter1, @punter2]

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

  def test_check_in_array_of_guests
    @pear_tree.check_in_array_of_guests(@guest_list)
    assert_equal([@punter1,@punter2], @pear_tree.guest_list)
  end

  def test_add_one_song_to_list
    @pear_tree.add_song(@alabama3)
    assert_equal([@alabama3], @pear_tree.play_list)
  end

  def test_count_guests()
    n = @pear_tree.check_in_array_of_guests(@guest_list)
    assert_equal(2,@pear_tree.count_guests(n))
  end

  def test_guest_can_afford_entry__true()
    assert_equal(true,@pear_tree.can_afford_entry?(@punter2))
  end

  def test_guest_can_afford_entry__fail()
    assert_equal(false,@pear_tree.can_afford_entry?(@punter1))
  end

  # def test_take_entry_fee()
  #   @pear_tree.take_entry_fee(@punter2)
  #   assert_equal(15,@punter2.wallet)
  # end

end
