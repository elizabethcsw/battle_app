require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base
  # enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    p params
    @player1 = Player.new(params[:name1])
    @player2 = Player.new(params[:name2])
    $game = Game.new(@player1, @player2)
    # p $player1 = Player.new(params[:name1])
    # p $player2 = Player.new(params[:name2])
    redirect '/play'
  end

  get '/play' do
    # @player1 = $player1
    # @player2 = $player2
    @game = $game
    erb :play
  end

  get '/attack' do
    p 'get request of /attack'
    # @player1 = $player1
    # @player2 = $player2
    @game = $game
    # @player2.game.attack(@player1)
    # Game.new.attack(@player1)
    @game.attack(@game.player1)
    erb :play
  end

  post '/attack2' do
    p 'post request of /attack2'
    # @player1 = $player1
    # @player2 = $player2
    @game = $game
    # @player1.game.attack(@player2)
    # Game.new.attack(@player2)
    @game.attack(@game.player2)
    erb :play
  end

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
