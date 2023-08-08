class CreateTargets < ActiveRecord::Migration[7.0]
  def change
    create_table :targets do |t|
      t.string     :targets_name, null: false
      t.string     :clothes,      null: false
      t.integer    :age,          null: false
      t.string     :resemble,     null: false
      t.references :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
