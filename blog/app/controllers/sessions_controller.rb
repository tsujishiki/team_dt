class SessionsController < ApplicationController
  
  skip_before_action :authorize
  
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    
    # 用email登录
    if !user
      user = User.find_by(email: params[:username])
    end
    
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "用户名密码错误"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url
  end
end
