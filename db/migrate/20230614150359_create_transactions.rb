# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions, id: :uuid do |t|
      t.decimal :amount, precision: 8, scale: 2, null: false
      t.string :type, null: false
      t.integer :status, null: false, default: 0
      t.string :customer_email, null: false
      t.string :customer_phone

      t.timestamps
    end
  end
end
