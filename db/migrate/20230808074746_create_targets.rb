class CreateTargets < ActiveRecord::Migration[7.0]
  def change
    create_table :targets do |t|
      t.string     :target_name, null: false
      t.string     :clothes,      null: false
      t.integer    :age,          null: false
      t.string     :resemble,     null: false
      t.references :user,         null: false, foreign_key: true
      t.string     :line_name, null: false
      t.string     :station,   null: false
      t.time     :ride_time, null: false
      t.timestamps
    end
  end
end
