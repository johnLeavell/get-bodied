class UsersController < ApplicationController
  skip_before_action(:force_user_sign_in, { only: [:index] })

  def index
    path_user = params.fetch('path_id')
    matching_user = User.where({ id: path_user })
    @the_user = matching_user.first

    @q = @the_user.ai_messages.all.order({ created_at: :desc }).ransack(params[:q])
    @user_workouts = @q.result.page(params[:page]).per(10)

    render template: 'users/index.html.erb'
  end
end
