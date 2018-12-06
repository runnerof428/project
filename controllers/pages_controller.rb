class PagesController < ApplicationController
  def top
    @users = User.all
  end

  def mypage
    @users = User.all
  end

  def profile
    @users = User.all
  end

  def changeprofile
    username = params[:username]
    password = params[:password]

    if (username == "" || password == "")
      redirect_to "/mypage/profile", flash: {error_message: "入力されていません"}
      return
    end

    users = User.where("username = ?", username)
    user = users[0]

    if (user && user != User.find(session[:id]))
      redirect_to "/mypage/profile", flash: {error_message: 
      "そのユーザーネームは既に使われています"}
    else 
      user = User.find(session[:id])
      user.username = username
      user.password = password
      user.save
      redirect_to "/mypage/profile"
    end
  end

  def register
  end

  def login
  end

  def subject
  end

  def submit
  end

  def newuser
    username = params[:username]
    password = params[:password]

    if (username == "" || password == "")
      redirect_to "/register", flash: {error_message: "入力されていません"}
      return
    end
    
    users = User.where("username = ?", username)
    user = users[0]

    if user
      redirect_to "/register", flash: {error_message: 
      "そのユーザーネームは既に使われています"}
    else 
      user = User.new
      user.username = username
      user.password = password
      user.save
      redirect_to "/login"
    end
  end

  def login_check
    username = params[:username]
    password = params[:password]

    users = User.where("username = ? and password = ?", username, password)
    user = users[0];

    if user
      session[:id] = user.id
      redirect_to "/"
    else
      error_message = 
      redirect_to "/login", flash: {error_message:
      "ユーザー名かパスワードが間違っています"}
    end
  end

  def logout
    session[:id] = nil
    redirect_to "/"
  end
end
