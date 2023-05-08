class UserWorkoutsController < ApplicationController
  def index
    matching_user_workouts = UserWorkout.all

    @list_of_user_workouts = matching_user_workouts.order({ :created_at => :desc })

    render({ :template => "user_workouts/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_user_workouts = UserWorkout.where({ :id => the_id })

    @the_user_workout = matching_user_workouts.at(0)

    render({ :template => "user_workouts/show.html.erb" })
  end

  def create
    the_user_workout = UserWorkout.new
    the_user_workout.user_id = params.fetch("query_user_id")
    the_user_workout.workout_id = params.fetch("query_workout_id")
    the_user_workout.completed_at = params.fetch("query_completed_at")
    the_user_workout.started_at = params.fetch("query_started_at")

    if the_user_workout.valid?
      the_user_workout.save
      redirect_to("/user_workouts", { :notice => "User workout created successfully." })
    else
      redirect_to("/user_workouts", { :alert => the_user_workout.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_user_workout = UserWorkout.where({ :id => the_id }).at(0)

    the_user_workout.user_id = params.fetch("query_user_id")
    the_user_workout.workout_id = params.fetch("query_workout_id")
    the_user_workout.completed_at = params.fetch("query_completed_at")
    the_user_workout.started_at = params.fetch("query_started_at")

    if the_user_workout.valid?
      the_user_workout.save
      redirect_to("/user_workouts/#{the_user_workout.id}", { :notice => "User workout updated successfully."} )
    else
      redirect_to("/user_workouts/#{the_user_workout.id}", { :alert => the_user_workout.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_user_workout = UserWorkout.where({ :id => the_id }).at(0)

    the_user_workout.destroy

    redirect_to("/user_workouts", { :notice => "User workout deleted successfully."} )
  end
end
