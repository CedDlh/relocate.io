class CreateAvailabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :availabilities do |t|
      t.string :day
      t.datetime :hour
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
