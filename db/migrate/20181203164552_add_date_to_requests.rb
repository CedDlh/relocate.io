class AddDateToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :date, :date
  end
end
