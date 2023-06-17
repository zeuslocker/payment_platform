# frozen_string_literal: true

class Transaction < ApplicationRecord
  has_ancestry

  enum :status, %i[approved reversed refunded error]
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :customer_email, presence: true
  validates :customer_phone, phone: { allow_blank: true }
end
