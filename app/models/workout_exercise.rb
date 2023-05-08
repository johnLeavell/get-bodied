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
  belongs_to(:workout, { :required => true, :class_name => "Workout", :foreign_key => "workout_id" })

  belongs_to(:exercise, { :required => true, :class_name => "Exercise", :foreign_key => "exercise_id" })
end
