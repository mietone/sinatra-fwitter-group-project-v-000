class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'users/signup'
    else
      redirect "/tweets"
    end
  end

  post '/signup' do
    user = User.new(params)

    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect "/users/signup"
    else
      user.save
      session[:user_id] = user.id
      redirect "/tweets"
    end
  end


end
