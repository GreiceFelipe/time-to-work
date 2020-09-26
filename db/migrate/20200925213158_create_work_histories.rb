class CreateWorkHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :work_histories do |t|
      t.datetime :starts_at, null: false
      t.datetime :ends_at
      t.datetime :lunch_starts
      t.datetime :lunch_ends
      t.float :worked_hours
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
