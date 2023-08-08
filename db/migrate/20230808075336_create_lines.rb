class CreateLines < ActiveRecord::Migration[7.0]
  def change
    create_table :lines do |t|
      t.string :line_name, null: false
      t.string :station,   null: false
      t.date   :ride_time, null: false
      t.timestamps
    end
  end
end
