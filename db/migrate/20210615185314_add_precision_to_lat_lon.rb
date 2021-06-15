class AddPrecisionToLatLon < ActiveRecord::Migration[6.1]
  def change
    change_column :routes, :lat, :decimal, :precision => 8, :scale => 5
    change_column :routes, :lon, :decimal, :precision => 8, :scale => 5
    change_column :records, :rating, :decimal, :precision => 2, :scale => 1
  end
end
