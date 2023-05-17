# == Schema Information
#
# Table name: user_workouts
#
#  id           :integer          not null, primary key
#  completed_at :string
#  started_at   :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  workout_id   :integer
#
class UserWorkout < ApplicationRecord
  belongs_to :user, optional: false, class_name: 'User'
  belongs_to :workout, optional: false, class_name: 'Workout'
end
