namespace :transactions do
  task delete_old: [:environment] do |_t|
    Transaction.where(created_at: ..1.hour.ago).destroy_all
  end
end
