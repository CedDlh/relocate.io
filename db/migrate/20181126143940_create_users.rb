class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.integer :plz
      t.string :languages
      t.string :specialties
      t.boolean :buddy

      t.timestamps
    end
  end
end
