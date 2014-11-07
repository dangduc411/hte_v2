class Client < ActiveRecord::Base

  def copy(quote)
    self.name = quote.name
    self.phone = quote.phone
    self.address = quote.address
  end
end
