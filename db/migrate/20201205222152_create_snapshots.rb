class CreateSnapshots < ActiveRecord::Migration[6.0]
  def change
    create_table :snapshots do |t|
      t.string :city
      t.string :region
      t.string :country
      t.float :high_f
      t.float :low_f
      t.float :temp_f
      t.float :high_c
      t.float :low_c
      t.float :temp_c
      t.float :wind_speed
      t.string :wind_dir
      t.string :weather_state
      t.string :date
      t.string :time
      t.float :predictability
      t.float :humidity

      t.timestamps
    end
  end
end
