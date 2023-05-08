class Exercise < ApplicationRecord
  has_many(:workout_exercises, { :class_name => "WorkoutExercise", :foreign_key => "exercise_id", :dependent => :destroy })
end
