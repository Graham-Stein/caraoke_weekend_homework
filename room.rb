class Room

  attr_reader :room_name, :spaces, :guest_list, :play_list

  def initialize(room_name, spaces, guest_list = [], play_list = [])
    @room_name = room_name
    @spaces = spaces
    @guest_list = guest_list
    @play_list = play_list

  end

  def check_in_guest(guest)
    @guest_list.push(guest)
    # take cash as entry fee from punter
    # check if guest can afford entry fee
    # set entry fee
    # check if spaces
  end

  def add_song(song)
    @play_list.push(song)
  end

end
