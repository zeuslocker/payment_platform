# frozen_string_literal: true

class Transaction < ApplicationRecord
  has_ancestry

  enum :status, %i[approved reversed refunded error]
  validate :amount, presence: true, numericality: { greater_than: 0 }
  validate :customer_email, presence: true
  validate :customer_phone, phone: { allow_blank: true }
end
