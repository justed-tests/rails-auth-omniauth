# ses con
class SessionsController < ApplicationController
  def create
    @user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = @user.id
    flash[:success] = "Welcome #{@user.name}"
  rescue StandardError => e
    p e
    p e.backtrace
    flash[:warning] = 'There are some problems in authentication'
  ensure
    redirect_to root_path
  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = 'Good bye'
    end

    redirect_to root_path
  end
end
