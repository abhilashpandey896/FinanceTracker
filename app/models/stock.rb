class Stock < ApplicationRecord
 has_many :user_stocks
 has_many :users, through: :user_stocks
    def self.new_from_lookup(ticker_symbol)
  StockQuote::Stock.new(api_key: "pk_21d1e9c6ea8b4b9f9fe52a806db3a971")
  begin
  looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
  new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol, last_price: looked_up_stock.latest_price)
  rescue Exception => e
    return nil
  end
end
end
