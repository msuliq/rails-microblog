# frozen_string_literal: true

class AddIndexToUsersEmail < ActiveRecord::Migration[6.0]
  def change
    # index added to optimize db query
    add_index :users, :email, unique: true
  end
end
