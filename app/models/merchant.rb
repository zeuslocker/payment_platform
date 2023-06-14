class Merchant < ApplicationRecord
  enum :status, %i(active inactive)
end
