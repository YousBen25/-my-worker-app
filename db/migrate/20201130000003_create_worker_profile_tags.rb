class CreateWorkerProfileTags < ActiveRecord::Migration[6.0]
  def change
    create_table :worker_profile_tags do |t|
      t.references :worker_profile, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
      t.integer :rate

      t.timestamps
    end
  end
end
