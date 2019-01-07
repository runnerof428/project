class PagesController < ApplicationController
  def top
    @users = User.all
    @subjects = Subject.all
  end

  def mypage
    @users = User.all
  end

  def profile
    @users = User.all
  end

  def submit
    @subjects = Subject.all
  end

  def submissionlist
    @user = User.find(session[:id])
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

  def newsubmit

    title = params[:title]

    content = params[:content]

    genre = params[:genre]

    s = Submission.new

    s.title = title
  
    s.content = content

    s.Genre_id = genre

    s.evaluation = 0

    s.User_id = session[:id]

    s.save

    redirect_to "/submit/completed"

  end

  def submit_completed
  end

  def eachsubmit
    id = params[:id]
    @submit = Submission.find(id)
  end

  def submitdelete
    Submission.find(params[:format]).delete
    redirect_to "/mypage/submissionlist"
  end

  def submitedit
    @id = params[:format]
  end

  def submiteditexe

    title = params[:title]

    content = params[:content]

    s = Submission.find(params[:id])

    s.title = title
  
    s.content = content

    s.save

    redirect_to "/mypage/submissionlist/"+params[:id].to_s

  end

  def kamoku
  end

  def addkamoku
    s = Subject.new
    s.subject = params[:kamoku]
    s.save
    redirect_to "/kamoku"
  end

  def genre
  end

  def addgenre
    g = Genre.new
    g.genre=params[:genre]
    g.Subject_id=Subject.where(subject:params[:kamoku])[0].id
    g.save
    redirect_to "/"
  end

  def fromtopsubmitlist
    id = params[:id]
    @g = Genre.find(id)
  end

  def fromtopeachsubmit
    @i = params[:id]
    id = params[:iid]
    @s = Submission.find(id)
  end

  def evaluate
    s = Submission.find(params[:format])
    if (Evaluation.where(User_id:session[:id], Submission_id:s.id)[0])
      s.evaluation -= 1
      Evaluation.where(User_id:session[:id], Submission_id:s.id)[0].delete
    else
      s.evaluation += 1
      e = Evaluation.new
      e.User_id = session[:id]
      e.Submission_id = s.id
      e.save
    end
    s.save
    redirect_back(fallback_location: "/")  
  end

end

