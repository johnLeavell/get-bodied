class Workout < ApplicationRecord
  has_many(:user_workouts, { :class_name => "UserWorkout", :foreign_key => "workout_id", :dependent => :destroy })

  has_many(:workout_exercises, { :class_name => "WorkoutExercise", :foreign_key => "workout_id", :dependent => :destroy })
end
