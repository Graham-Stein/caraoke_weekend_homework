require("minitest/autorun")
require("minitest/rg")
require_relative("../guest.rb")

class TestGuest < MiniTest::Test

  def setup()
    @punter1 = Guest.new("Mike Tyson")
    @punter2 = Guest.new("Guy Wimble", 20)
  end

  def test_guest_has_name()
    assert_equal("Mike Tyson", @punter1.guest_name)
  end

  def test_guest_has_empty_wallet()
    assert_equal(0, @punter1.wallet)
  end

  def test_add_cash()
    @punter1.add_remove_cash(10)
    assert_equal(10, @punter1.wallet)
  end

  def test_remove_cash()
    @punter2.add_remove_cash(-10)
    assert_equal(10, @punter2.wallet)
  end
end
