class ChangeTimeType < ActiveRecord::Migration[6.0]
  def change
    change_column :availabilities, :from, :time
    change_column :availabilities, :to, :time
  end
end
