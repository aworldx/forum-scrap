Rails.application.routes.draw do
  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      namespace :communication do 
        get 'private_messages', to: 'private_messages#show'
      end

      namespace :users do 

      end
    end
  end
end
