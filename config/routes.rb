Rails.application.routes.draw do
  resources :dog_walkings, only: [:index, :show, :create]

  scope '/dog_walkings' do
    post 'start_walk/:id', to: 'dog_walkings#start_walk'
    post 'finish_walk/:id', to: 'dog_walkings#finish_walk'
  end
end
