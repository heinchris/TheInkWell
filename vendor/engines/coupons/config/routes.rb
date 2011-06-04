::Refinery::Application.routes.draw do
  resources :coupons, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :coupons, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
