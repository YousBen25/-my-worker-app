class CreateWorkerProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :worker_profiles do |t|
      t.text :bio
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
