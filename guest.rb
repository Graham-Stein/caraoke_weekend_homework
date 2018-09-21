class Guest

  attr_reader :guest_name, :wallet

  def initialize(guest_name, wallet = 0)
    @guest_name = guest_name
    @wallet     = wallet
  end

  def add_remove_cash(cash)
    @wallet += cash
  end

end
