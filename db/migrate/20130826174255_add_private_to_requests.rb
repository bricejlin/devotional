class AddPrivateToRequests < ActiveRecord::Migration
  def change
  	add_column :requests, :private, :boolean, default: false
  end
end
