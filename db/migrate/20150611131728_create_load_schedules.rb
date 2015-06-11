class CreateLoadSchedules < ActiveRecord::Migration
  def change
    create_table :load_schedules do |t|
      t.string :area_code
      t.string :next_outage
      t.string :next_outage_period

      t.timestamps null: false
    end
  end
end
