class CreateWorkoutExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :workout_exercises do |t|
      t.integer :exercise_id
      t.integer :workout_id
      t.integer :reps
      t.integer :weight
      t.integer :sets

      t.timestamps
    end
  end
end
