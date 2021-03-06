require("pry")


class Room

  attr_reader :room_name, :spaces, :guest_list, :play_list, :entry_fee
  attr_accessor :till
  def initialize(room_name, spaces)
    @room_name  = room_name
    @spaces     = spaces
    @guest_list = []
    @play_list  = []
    @entry_fee = 5
    @till = 0

  end

  def check_in_guest(guest)
    if max_guests(@guest_list) && can_afford_entry?(guest) == true
    @guest_list.push(guest)
    else
      if max_guests(@guest_list) == false
        p "No entry #{guest.guest_name}, we're too full."
      elsif can_afford_entry?(guest) == false
        p "No entry #{guest.guest_name}, you're skint!"
      else
        nil
      end
    end
  end

  def check_in_array_of_guests(guests)
    guests.each {|guest|
      check_in_guest(guest)
    }
  end

  def check_out_guest(guest)
    @guest_list.delete(guest)
  end

  def count_guests(guests)
    guests.count
  end

  def max_guests(guests)
    count_guests(guests) <= @spaces
  end

  def print_guests
    temp_array = []
    @guest_list.each {|entry|
      temp_array.push(entry.guest_name)
    }
    temp_array.join(", ")
  end

  def can_afford_entry?(guest)
    guest.wallet >= @entry_fee
  end

  def take_entry_fee(guest)
    guest.wallet -= @entry_fee
    # binding.pry
    @till += @entry_fee
    # binding.pry
  end

  def add_song(song)
    @play_list.push(song)
  end

  def add_array_of_songs(songs)
    songs.each {|song|
      add_song(song)
    }
  end

end
