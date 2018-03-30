require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :'index'
  end



  helpers do

    def logged_in?(session)
      !!current_user
    end

    def current_user
      @current_user ||= User.find(session[:id]) if session["id"]
    end

    def login(session)
      # check if a user with this user_id actually exists
      # if so, set the session
      @user = User.find(session[:id])
      if @user && @user.authenticate(password)
        session[:id] = @user.id
      else
        redirect '/login'
      end
    end

  end


end
