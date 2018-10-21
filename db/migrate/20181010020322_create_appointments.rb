class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :time
      t.string :notes
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
