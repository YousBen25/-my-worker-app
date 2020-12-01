class ChangeColumnTypesToAvailabilities < ActiveRecord::Migration[6.0]
  def change
    remove_column :availabilities, :from
    remove_column :availabilities, :to
    add_column :availabilities, :from, :datetime
    add_column :availabilities, :to, :datetime
  end
end
