class ExercisesController < ApplicationController
  def index
    matching_exercises = Exercise.all

    @list_of_exercises = matching_exercises.order({ created_at: :desc })

    render({ template: 'exercises/index.html.erb' })
  end

  def show
    the_id = params.fetch('path_id')

    matching_exercises = Exercise.where({ id: the_id })

    @the_exercise = matching_exercises.at(0)

    render({ template: 'exercises/show.html.erb' })
  end

  def create
    the_exercise = Exercise.new
    the_exercise.name = params.fetch('query_name')
    the_exercise.description = params.fetch('query_description')

    if the_exercise.valid?
      the_exercise.save
      redirect_to('/exercises', { notice: 'Exercise created successfully.' })
    else
      redirect_to('/exercises', { alert: the_exercise.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch('path_id')
    the_exercise = Exercise.where({ id: the_id }).at(0)

    the_exercise.name = params.fetch('query_name')
    the_exercise.description = params.fetch('query_description')

    if the_exercise.valid?
      the_exercise.save
      redirect_to("/exercises/#{the_exercise.id}", { notice: 'Exercise updated successfully.' })
    else
      redirect_to("/exercises/#{the_exercise.id}", { alert: the_exercise.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch('path_id')
    the_exercise = Exercise.where({ id: the_id }).at(0)

    the_exercise.destroy

    redirect_to('/exercises', { notice: 'Exercise deleted successfully.' })
  end
end
