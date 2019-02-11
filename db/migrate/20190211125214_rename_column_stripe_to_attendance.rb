class RenameColumnStripeToAttendance < ActiveRecord::Migration[5.2]
  def change
  	  rename_column :attendances, :strip_customer_id, :stripe_customer_id
  end
end
