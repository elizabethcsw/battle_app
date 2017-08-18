require 'sinatra/base'
require_relative './lib/player'

class Battle < Sinatra::Base
  # enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    p params
    p $player1 = Player.new(params[:name1])
    p $player2 = Player.new(params[:name2])
    redirect '/play'
  end

  get '/play' do
    @player1 = $player1
    @player2 = $player2
    erb :play
  end

  get '/attack' do
    p 'get request of /attack'
    @player1 = $player1
    @player2 = $player2
    @player2.attack(@player1)
    erb :play
  end

  post '/attack2' do
    p 'post request of /attack2'
    @player1 = $player1
    @player2 = $player2
    @player1.attack(@player2)
    erb :play
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end

=begin
# Old codes using sessions:

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post "/names" do
    p params
    p session[:player1] = params[:name1]
    p session[:player2] = params[:name2]
    redirect '/play'
  end

  get '/play' do
    @name1 = session[:player1]
    @name2 = session[:player2]
    @player1_hp = 100
    @player2_hp = 100
    session[:player1_hp] = @player1_hp
    session[:player2_hp] = @player2_hp
    erb :play
  end

  get "/attack" do
    p params
    @name1 = session[:player1]
    @name2 = session[:player2]
    @player1_hp = session[:player1_hp]
    @player2_hp = session[:player2_hp]
    @player1_hp-=10
    session[:player1_hp] = @player1_hp
    session[:player2_hp] = @player2_hp
    erb :play
  end

  post '/attack2' do
    @name1 = session[:player1]
    @name2 = session[:player2]
    @player1_hp = session[:player1_hp]
    @player2_hp = session[:player2_hp]
    @player2_hp-=10
    session[:player1_hp] = @player1_hp
    session[:player2_hp] = @player2_hp
    erb :play
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

=end
