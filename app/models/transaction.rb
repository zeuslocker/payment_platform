# frozen_string_literal: true

class Transaction < ApplicationRecord
  SUB_TYPES = { Authorize: AuthorizeTransaction, Charge: ChargeTransaction, Refund: RefundTransaction,
                Reversal: ReversalTransaction }.with_indifferent_access
  has_ancestry

  enum :status, %i[approved reversed refunded error]
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :customer_email, presence: true
  validates :customer_phone, phone: { allow_blank: true }

  def self.infer_type!(type)
    type = Transaction::SUB_TYPES[type]
    raise 'Unknown transaction type' unless type

    type
  end
end
