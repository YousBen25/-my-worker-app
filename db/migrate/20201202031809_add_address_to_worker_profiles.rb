class AddAddressToWorkerProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :worker_profiles, :address, :string
  end
end
