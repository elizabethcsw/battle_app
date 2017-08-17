# my_app.rb
require 'sinatra/base'
# require 'socket'

class Battle < Sinatra::Base

  get '/' do
    # socket.puts 'Testing infrastructure working!'
    erb :index
  end

  post "/names" do
    p params
    @name1 = params[:name1]
    @name2 = params[:name2]
    erb(:play)
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
