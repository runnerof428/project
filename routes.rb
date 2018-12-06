Rails.application.routes.draw do
  get '/', to: "pages#top"

  get '/mypage', to: "pages#mypage"

  get '/register',to: "pages#register"

  get '/login',to: "pages#login"

  get '/subject',to: "pages#subject"

  get '/subject/submit',to: "pages#submit"

  post '/register',to: "pages#newuser"

  post '/login',to: "pages#login_check"

  get '/logout', to: "pages#logout"

  get '/mypage/profile', to: "pages#profile"

  post '/mypage/profile', to: "pages#changeprofile"
end
