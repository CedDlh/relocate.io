class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :kind
      t.references :request, foreign_key: true
      t.date :date
      t.string :location
      t.boolean :paid

      t.timestamps
    end
  end
end
