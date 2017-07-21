class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    if @user
      session[:user_id] = @user.id
      redirect_to root_path
    else
      head 403
    end
  end

  def delete
    session.delete(:user_id)
    redirect_to root_path
  end
end
