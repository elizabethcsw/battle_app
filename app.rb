require 'sinatra/base'
require_relative './lib/player'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post "/names" do
    p params
    # p session[:player1] = params[:name1]
    $player1 = Player.new(params[:name1])
    # p session[:player2] = params[:name2]
    $player2 = Player.new(params[:name2])
    redirect '/play'
  end

  get '/play' do
    # @name1 = session[:player1]
    @name1 = $player1.name
    # @name2 = session[:player2]
    @name2 = $player2.name
    @player1_hp = 100
    @player2_hp = 100
    session[:player1_hp] = @player1_hp
    session[:player2_hp] = @player2_hp
    erb :play
  end

  post "/play" do
    p params
    # @name1 = session[:player1]
    @name1 = $player1.name
    # @name2 = session[:player2]
    @name2 = $player2.name
    @player1_hp = session[:player1_hp]
    @player2_hp = session[:player2_hp]
    @player1_hp-=10
    session[:player1_hp] = @player1_hp
    session[:player2_hp] = @player2_hp
    erb :play
  end

  post '/play2' do
    p params
    # @name1 = session[:player1]
    @name1 = $player1.name
    # @name2 = session[:player2]
    @name2 = $player2.name
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
