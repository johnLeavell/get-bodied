class UsersController < ApplicationController
  skip_before_action(:force_user_sign_in, { :only => [:index] })

  def index
    path_user = params.fetch("path_id")
    matching_user = User.where({ :id => path_user })
    @the_user = matching_user.first

    # message = response.dig("choices", 0, "message")
    # the_ai_message.role = message.dig("role")
    # the_ai_message.content = message.dig("content")
    # the_ai_message.user = @current_user

    @user_workouts = AiMessage.where({ :id => @the_user.id}).first
# binding.pry
    render template: "users/index.html.erb"
  end
end
