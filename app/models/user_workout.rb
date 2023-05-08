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
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })

  belongs_to(:workout, { :required => true, :class_name => "Workout", :foreign_key => "workout_id" })

end
