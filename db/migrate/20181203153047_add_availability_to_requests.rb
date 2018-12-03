class AddAvailabilityToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :availabilty, :date
  end
end
