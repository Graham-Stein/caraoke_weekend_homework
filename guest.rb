class Guest

  attr_reader :guest_name 
  attr_accessor :wallet

  def initialize(guest_name, wallet = 0)
    @guest_name = guest_name
    @wallet     = wallet
  end

  def add_remove_cash(cash)
    @wallet += cash
  end

end
