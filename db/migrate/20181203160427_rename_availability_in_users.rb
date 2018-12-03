class RenameAvailabilityInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :availabilty, :availability
  end
end
