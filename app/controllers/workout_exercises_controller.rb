class WorkoutExercisesController < ApplicationController
  def index
    matching_workout_exercises = WorkoutExercise.all

    @list_of_workout_exercises = matching_workout_exercises.order({ :created_at => :desc })

    render({ :template => "workout_exercises/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_workout_exercises = WorkoutExercise.where({ :id => the_id })

    @the_workout_exercise = matching_workout_exercises.at(0)

    render({ :template => "workout_exercises/show.html.erb" })
  end

  def create
    the_workout_exercise = WorkoutExercise.new
    the_workout_exercise.exercise_id = params.fetch("query_exercise_id")
    the_workout_exercise.workout_id = params.fetch("query_workout_id")
    the_workout_exercise.reps = params.fetch("query_reps")
    the_workout_exercise.weight = params.fetch("query_weight")
    the_workout_exercise.sets = params.fetch("query_sets")

    if the_workout_exercise.valid?
      the_workout_exercise.save
      redirect_to("/workout_exercises", { :notice => "Workout exercise created successfully." })
    else
      redirect_to("/workout_exercises", { :alert => the_workout_exercise.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_workout_exercise = WorkoutExercise.where({ :id => the_id }).at(0)

    the_workout_exercise.exercise_id = params.fetch("query_exercise_id")
    the_workout_exercise.workout_id = params.fetch("query_workout_id")
    the_workout_exercise.reps = params.fetch("query_reps")
    the_workout_exercise.weight = params.fetch("query_weight")
    the_workout_exercise.sets = params.fetch("query_sets")

    if the_workout_exercise.valid?
      the_workout_exercise.save
      redirect_to("/workout_exercises/#{the_workout_exercise.id}", { :notice => "Workout exercise updated successfully."} )
    else
      redirect_to("/workout_exercises/#{the_workout_exercise.id}", { :alert => the_workout_exercise.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_workout_exercise = WorkoutExercise.where({ :id => the_id }).at(0)

    the_workout_exercise.destroy

    redirect_to("/workout_exercises", { :notice => "Workout exercise deleted successfully."} )
  end
end
