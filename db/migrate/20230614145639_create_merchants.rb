# frozen_string_literal: true

class CreateMerchants < ActiveRecord::Migration[7.0]
  def change
    create_table :merchants, id: :uuid do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :email, null: false
      t.integer :status, null: false, default: 0
      t.decimal :total_transaction_sum, precision: 8, scale: 2, default: 0

      t.timestamps
    end

    add_index :merchants, :email, unique: true
  end
end
