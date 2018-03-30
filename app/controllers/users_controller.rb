class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
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
