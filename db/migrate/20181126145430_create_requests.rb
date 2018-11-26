class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :status
      t.references :user
      t.references :buddy

      t.timestamps
    end
    add_foreign_key :requests, :users, column: :user_id, primary_key: :id
    add_foreign_key :requests, :users, column: :buddy_id, primary_key: :id
  end
end
