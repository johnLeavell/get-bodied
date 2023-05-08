class CreateUserWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :user_workouts do |t|
      t.integer :user_id
      t.integer :workout_id
      t.string :completed_at
      t.string :started_at

      t.timestamps
    end
  end
end
