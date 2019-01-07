Rails.application.routes.draw do
  get '/', to: "pages#top"

  get '/mypage', to: "pages#mypage"

  get '/register',to: "pages#register"

  get '/login',to: "pages#login"

  post '/register',to: "pages#newuser"

  post '/login',to: "pages#login_check"

  get '/logout', to: "pages#logout"

  get '/mypage/profile', to: "pages#profile"

  post '/mypage/profile', to: "pages#changeprofile"

  get '/mypage/submissionlist', to:"pages#submissionlist"

  get '/submit', to: "pages#submit"

  post '/submit', to: "pages#newsubmit"

  get '/submit/completed', to: "pages#submit_completed"

  get '/mypage/submissionlist/:id', to: "pages#eachsubmit"

  get '/submitdelete', to: "pages#submitdelete"

  get '/submitedit', to: "pages#submitedit"

  post '/submitedit', to: "pages#submiteditexe"

  post '/kamoku', to: "pages#addkamoku"

  get '/kamoku', to: "pages#kamoku"

  post '/genre', to: "pages#addgenre"

  get '/genre', to: "pages#genre"

  get '/submissionlist/:id', to: "pages#fromtopsubmitlist"

  get '/submissionlist/:id/:iid', to: "pages#fromtopeachsubmit"

  get '/evaluate', to: "pages#evaluate"
end
