# frozen_string_literal: true

Rails.application.routes.draw do
  resources :transactions, only: %i[index create new]
  devise_for :admins
end
