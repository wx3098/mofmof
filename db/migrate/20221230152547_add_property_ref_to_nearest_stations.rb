class AddPropertyRefToNearestStations < ActiveRecord::Migration[6.0]
  def change
    add_reference :nearest_stations, :property, null: false, foreign_key: true
  end
end
