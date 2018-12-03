class AddAvailabilityToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :availabilty, :date
  end
end
