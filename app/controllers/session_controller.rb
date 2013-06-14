class SessionController < ApplicationController
  def new
  end

  def create
  	auth = env["omniauth.auth"]
  	user = User.from_omniauth(auth)
  	session[:user_id] = user.id
  	redirect_to root_path, notice: "로그인 성공!!"
  end

  def failure
  	render text: "로그인 실패!!"
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path, notice: "로그아웃 성공!!"
  end
end