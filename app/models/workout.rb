# == Schema Information
#
# Table name: workouts
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Workout < ApplicationRecord
  has_many :user_workouts, class_name: 'UserWorkout', dependent: :destroy
  has_many :workout_exercises, class_name: 'WorkoutExercise', dependent: :destroy
end
