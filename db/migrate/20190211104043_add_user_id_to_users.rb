class AddUserIdToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_reference :attendances, :user, index: true
  	add_reference :attendances, :event, foreign_key: true
  end
end
