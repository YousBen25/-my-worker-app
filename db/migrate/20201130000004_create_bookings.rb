class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.references :worker_profile_tag, null: false, foreign_key: true
      t.boolean :confirmation, default: false
      t.datetime :date
      t.integer :duration
      t.integer :price

      t.timestamps
    end
  end
end
