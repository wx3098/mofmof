class CreateNearestStations < ActiveRecord::Migration[6.0]
  def change
    create_table :nearest_stations do |t|
      t.string :route_name
      t.string :station_name
      t.integer :foot

      t.timestamps :nearest_stations, :
    end
  end
end
