require("minitest/autorun")
require("minitest/rg")
require("pry")
require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../song.rb")

class TestRoom < MiniTest::Test

  def setup()
    @pear_tree = Room.new("Pear Tree Upstairs", 7)
    @worlds_end = Room.new("World's End", 7)

    @punter1 = Guest.new("Mike Tyson")
    @punter2 = Guest.new("Guy Wimble", 20)
    @guest_list = [@punter1, @punter2]

    @pun1 = Guest.new("Ben A", 15)
    @pun2 = Guest.new("Ben B", 15)
    @pun3 = Guest.new("Ben C", 15)
    @pun4 = Guest.new("Ben D", 15)
    @pun5 = Guest.new("Ben E", 15)
    @pun6 = Guest.new("Ben F", 15)
    @pun7 = Guest.new("Ben G", 15)
    @pun8 = Guest.new("Ben H", 15)

    @pun_list = [@pun1, @pun2, @pun3, @pun4, @pun5, @pun6, @pun7, @pun8]


    @alabama3 = Song.new("12 Step Plan")
  end

  def test_room_has_name
    assert_equal("Pear Tree Upstairs", @pear_tree.room_name)
  end

  def test_room_has_spaces
    assert_equal(7, @pear_tree.spaces)
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

  def test_print_guest_list()
    @pear_tree.check_in_array_of_guests(@guest_list)
    assert_equal("Mike Tyson, Guy Wimble",@pear_tree.print_guests)
  end

  def test_max_number_exceeded_true
    @worlds_end.check_in_array_of_guests(@pun_list)
    # binding.pry
    assert_equal(8, @worlds_end.count_guests(@pun_list))
    assert_equal(true, @worlds_end.max_guests(@pun_list))
  end

  def test_max_number_exceeded_false
    @pear_tree.check_in_array_of_guests(@guest_list)
    # binding.pry
    assert_equal(2, @pear_tree.count_guests(@guest_list))
    assert_equal(false, @pear_tree.max_guests(@guest_list))
  end

  def test_take_entry_fee()
    @pear_tree.take_entry_fee(@punter2)
    assert_equal(15,@punter2.wallet)
    assert_equal(5,@pear_tree.till)
  end

end
