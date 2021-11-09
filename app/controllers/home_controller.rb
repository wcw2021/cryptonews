class HomeController < ApplicationController

  def index
    require 'net/http'
    require 'json'

    # Grab News Data
    @url = 'https://min-api.cryptocompare.com/data/v2/news/?lang=EN&api_key={1f80a9b829d8dc4fb7d909a8556def9ba395101394c3e7b8f4d016f146bd875e}'

    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @news = JSON.parse(@response)

    # Grab Price Data
    @prices_url = 'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,USDT,ADA,XRP,DOT,DOGE,USDC&tsyms=USD&api_key={1f80a9b829d8dc4fb7d909a8556def9ba395101394c3e7b8f4d016f146bd875e}'

    @prices_uri = URI(@prices_url)
    @prices_response = Net::HTTP.get(@prices_uri)
    @prices = JSON.parse(@prices_response)
  end

  def prices
    require 'net/http'
    require 'json'
    @symbol = params[:sym] 
    
    if @symbol
      @symbol = @symbol.upcase

      # Grab Price Data
      @quote_url = 'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=' +  @symbol + '&tsyms=USD&api_key={1f80a9b829d8dc4fb7d909a8556def9ba395101394c3e7b8f4d016f146bd875e}'

      @quote_uri = URI(@quote_url)
      @quote_response = Net::HTTP.get(@quote_uri)
      @quote = JSON.parse(@quote_response)
    end
  end

end



