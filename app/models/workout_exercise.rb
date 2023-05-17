# == Schema Information
#
# Table name: workout_exercises
#
#  id          :integer          not null, primary key
#  reps        :integer
#  sets        :integer
#  weight      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  exercise_id :integer
#  workout_id  :integer
#
class WorkoutExercise < ApplicationRecord
  belongs_to :workout, optional: false, class_name: 'Workout'
  belongs_to :exercise, optional: false, class_name: 'Exercise'
end
