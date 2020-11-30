class CreateAvailabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :availabilities do |t|
      t.integer :day
      t.time :from
      t.time :to
      t.references :worker_profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
