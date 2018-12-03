class RemoveAvailbilityFromRequests < ActiveRecord::Migration[5.2]
  def change
    remove_column :requests, :availabilty
  end
end
