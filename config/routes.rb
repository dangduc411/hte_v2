Rails.application.routes.draw do

  #get 'user_sessions/new'

  #get 'user_sessions/create'

  #get 'user_sessions/destroy'

  
  resources :users

  root 'pages#trang_chu'
  get 'thue-may-game', to: 'pages#thue_may_game', as: :thue_may_game
  get 'danh-sach-game', to: 'pages#danh_sach_game', as: :danh_sach_game
  get 'shop-thiet-bi', to: 'pages#shop_thiet_bi', as: :shop_thiet_bi
  get 'shop-giftcard', to: 'pages#shop_giftcard', as: :shop_giftcard
  get 'cau-hoi-thuong-gap', to: 'pages#cau_hoi_thuong_gap', as: :cau_hoi_thuong_gap
  get 'xac-nhan-yeu-cau', to: 'pages#xac_nhan_yeu_cau', as: :xac_nhan_yeu_cau
  post 'dat-thue', to: 'pages#dat_thue', as: :dat_thue
  get 'express_checkout', to: 'billing#express_checkout'
  #get ':id/chi-tiet-thiet-bi', to: 'pages#chi_tiet_thiet_bi', as: :chi_tiet_thiet_bi

  

  namespace :admin do
    root 'dashboard#show'
    resources :games
    resources :products
    resources :consoles
    resources :quotes, only: [:index, :show] do
      member do
        post :cancel
      end
    end
    get 'contracts/record/:id' => 'contracts#record', :as => :record
    resources :contracts
    resources :inventory_items
    resources :shippings
    resources :user_sessions
    resources :users

    get 'login' => 'user_sessions#new', :as => :login
    post 'logout' => 'user_sessions#destroy', :as => :logout

  end

end
