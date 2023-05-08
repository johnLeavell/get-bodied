class UserWorkout < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })

  belongs_to(:workout, { :required => true, :class_name => "Workout", :foreign_key => "workout_id" })

end
