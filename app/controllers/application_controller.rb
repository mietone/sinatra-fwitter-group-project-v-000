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

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
      # if session[:user_id]
      #   @current_user ||= User.where(id: session[:user_id]).first
      # end

    def login(session)
      # check if a user with this user_id actually exists
      # if so, set the session
      @user = User.find(session[:id])
      if @user && @user.authenticate(password)
        session[:user_id] = @user.id
      else
        redirect '/login'
      end
    end

    def logout!
      session[:user_id] = nil
    end

  end


end
