class WorkoutExercise < ApplicationRecord
  belongs_to(:workout, { :required => true, :class_name => "Workout", :foreign_key => "workout_id" })

  belongs_to(:exercise, { :required => true, :class_name => "Exercise", :foreign_key => "exercise_id" })
end
