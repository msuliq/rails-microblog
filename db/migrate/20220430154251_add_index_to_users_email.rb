class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    #index added to optimize db query 
    add_index :users, :email, unique: true
  end
end
