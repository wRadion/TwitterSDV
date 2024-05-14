class SessionsController < ApplicationController
  def new
  end

  def create
    email = sessions_params[:email]
    password = sessions_params[:password]

    user = User.find_by(email: email)
    if user.authenticate(password)
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  private

    def sessions_params
      params.permit(:email, :password)
    end
end
