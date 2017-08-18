Rails.application.routes.draw do
  
  # 프론트를 합칩니다 ㅎㅎ/ 0816 / 이태규
  root 'home#home'
  get 'home/home'
  get 'home/ask'
  get 'home/write'
  get 'home/message'
  get 'home/user_page'
  
  # 회원가입 및 정보 관련 라우팅 / 0806 / 김단아 
  devise_for :users, controllers: {registrations: 'users/registrations', confirmations: 'confirmations'}

  # 로그인과 로그아웃 라우팅 / 0815 / 김단아
  devise_scope :user do
  get 'login', to: 'devise/sessions#new'
  get 'logout', to: 'devise/sessions#destroy'
  end

  # 메세지 관련 라우팅 / 0816 / 김단아
  resources :conversations, only: [:index, :show]
  resources :users, only: [:index]
  resources :personal_messages, only: [:new, :create]
  
  # CRUD 관련 routing/0728/장윤서
  
  #create
    get '/home/new' => 'home#new'
    get '/home/form_ask' => 'home#form_ask'
    get '/home/form_notice' => 'home#form_notice'
    post '/home/create' => 'home#create'
  
  #CRUD 관련 routing/0728/장윤서 
  
  #read 
    get 'home/index'
    get 'home/notice'
    get 'home/ask'
    get '/home/show/:post_id' => 'home#show', as: "show_post"
    
  #CRUD 관련 routing/0803/장윤서 
  
  #update
    get '/home/edit/:post_id' => 'home#edit', as: "edit_post"
    post '/home/update/:post_id' => 'home#update', as: "update_post"
  
  #delete
    post '/home/destroy/:post_id' => 'home#destroy', as: "destroy_post"
    
  ##comment
  resources :posts do
    resources :comments
  end

  resources :comments # 댓글 라우팅
  #create 
    post '/home/show/:post_id/comments/create' => 'comments#create', as: "create_comment"
    
  #destroy 
    post '/home/show/:post_id/comments/destroy/:comment_id' => 'comments#destroy', as: "destroy_comment"
    
  ##recomment
  #create 
    post '/home/show/:post_id/:comment_id/recomments/create' => 'recomments#create', as: "create_recomment"
    
  #destroy
    post '/home/show/:post_id/:comment_id/recomments/destroy/:recomment_id' => 'recomments#destroy', as: "destroy_recomment"
end


