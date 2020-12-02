class AddCoordinatesToWorkerProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :worker_profiles, :latitude, :float
    add_column :worker_profiles, :longitude, :float
  end
end
