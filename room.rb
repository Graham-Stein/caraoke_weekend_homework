class Room

  attr_reader :room_name, :spaces, :guest_list, :play_list, :entry_fee

  def initialize(room_name, spaces)
    @room_name  = room_name
    @spaces     = spaces
    @guest_list = []
    @play_list  = []
    @entry_fee = 5

  end

  def check_in_guest(guest)
    @guest_list.push(guest)
    # take cash as entry fee from punter
    # check if guest can afford entry fee
    # set entry fee
    # check if spaces
  end

  def take_entry_fee(guest)
    
  end

  def can_afford_entry?(guest)
    p @entry_fee
    guest.wallet >= @entry_fee
  end

  def count_guests(guests)
    guests.count
  end

  def check_in_array_of_guests(guests)
    guests.each {|guest|
      check_in_guest(guest)
                }
  end

  def add_song(song)
    @play_list.push(song)
  end

end
