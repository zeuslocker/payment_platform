# frozen_string_literal: true

class Merchant < ApplicationRecord
  enum :status, %i[active inactive]
end
