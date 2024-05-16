Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: redirect('/start')
  
  get 'welcome' => 'pages#home'

  get 'start' => 'attendees#start'
  get 'list' => 'attendees#list'

  get 'print' => 'attendees#to_print'
  get 'get_print' => 'attendees#get_print_html'

  resources :attendees, except: :index do
    member do
      patch :checkin
      get :checkin
      patch :print
      get :print
    end
  end

  get '/attendees', to: redirect('/start')
  # get 'attendees/confirm' => 'attendees#confirm', as: :grad_confirm
end
