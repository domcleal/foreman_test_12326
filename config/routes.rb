Rails.application.routes.draw do
  get 'new_action', to: 'foreman_test/hosts#new_action'
end
