class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :from_time
      t.datetime :to_time
      t.string :doctor_id
      t.timestamps
    end
  end
end
