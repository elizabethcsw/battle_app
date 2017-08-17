# my_app.rb
require 'sinatra/base'
# require 'socket'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    # socket.puts 'Testing infrastructure working!'
    erb :index
  end

  post "/names" do
    p params
    p session[:player1] = params[:name1]
    p session[:player2] = params[:name2]
    redirect '/play'
    save_and_open_page
  end

  get '/play' do
    @name1 = session[:player1]
    @name2 = session[:player2]
    @player1_hp = 100
    @player2_hp = 100
    erb :play
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
