require './environment'
require 'pry'

module FormsLab
  class App < Sinatra::Base

    get '/' do
      erb :root
    end

    get '/new' do
      erb :new
    end

    post '/pirates' do
      @pirate = Pirate.new(params["pirate"]["name"], params["pirate"]["weight"], params["pirate"]["height"])

      params["pirate"]["ships"].each do |data|
        Ship.new(data["name"], data["type"], data["booty"])
      end

      @ships = Ship.all

      erb :show
    end

  end
end
