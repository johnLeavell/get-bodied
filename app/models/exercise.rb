# == Schema Information
#
# Table name: exercises
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Exercise < ApplicationRecord
  has_many(:workout_exercises, { :class_name => "WorkoutExercise", :foreign_key => "exercise_id", :dependent => :destroy })
end
