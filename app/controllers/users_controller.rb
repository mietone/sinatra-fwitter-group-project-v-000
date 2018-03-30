class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    @user = User.new(params)

    if !params.empty?
      @user.save
      session[:id] = @user.id
      redirect "/tweets"
    else
      redirect "/users/signup"
    end
  end


end
