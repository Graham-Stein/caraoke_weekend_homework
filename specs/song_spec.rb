require("minitest/autorun")
require("minitest/rg")
require_relative("../song.rb")

class TestSong < MiniTest::Test

  def setup()
    @alabama3 = Song.new("12 Step Plan")
  end

  def test_song_has_title()
    assert_equal("12 Step Plan", @alabama3.song_name)
  end

end
