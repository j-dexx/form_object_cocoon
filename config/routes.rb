Rails.application.routes.draw do
  resource :task_list_builders, only: [:new, :create]
  root to: 'task_lists#index'
end
