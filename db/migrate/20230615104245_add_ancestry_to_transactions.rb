# frozen_string_literal: true

class AddAncestryToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :ancestry, :string
    add_index :transactions, :ancestry
  end
end
