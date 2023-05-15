class AiMessagesController < ApplicationController
  require "openai"

  def index
    @q = AiMessage.all.order({ :created_at => :desc }).ransack(params[:q])
    @ai_messages = @q.result

    render({ :template => "ai_messages/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_ai_messages = AiMessage.where({ :id => the_id })

    @the_ai_message = matching_ai_messages.first

    render({ :template => "ai_messages/show.html.erb" })
  end

  def create
    the_ai_message = @current_user.ai_messages.create(
      content: params.fetch("query_content"),
    )

    if the_ai_message.persisted?
      client = OpenAI::Client.new(access_token: ENV.fetch("CHAT_API"), request_timeout: 240)

      # binding.pry

      response = client.chat(
        parameters: {
          model: "gpt-3.5-turbo",
          messages: @current_user.api_messages_array,
          temperature: 0.7,
        },
      )

      new_ai_message_params = response.dig("choices", 0, "message")
      # TODO: throw error if new_ai_message_params.nil?
      @current_user.ai_messages.create(new_ai_message_params)

      redirect_to("/users/#{@current_user.id}", { :notice => "AI message created successfully." })
    else
      redirect_to("/ai_messages", { :alert => the_ai_message.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_ai_message = AiMessage.where({ :id => the_id }).at(0)

    the_ai_message.role = params.fetch("query_role")
    the_ai_message.content = params.fetch("query_content")
    the_ai_message.user_id = params.fetch("query_user_id")

    if the_ai_message.valid?
      the_ai_message.save
      redirect_to("/ai_messages/#{the_ai_message.id}", { :notice => "Ai message updated successfully." })
    else
      redirect_to("/ai_messages/#{the_ai_message.id}", { :alert => the_ai_message.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_ai_message = AiMessage.where({ :id => the_id }).at(0)

    the_ai_message.destroy

    redirect_to("/users/#{@current_user.id}", { :notice => "Ai message deleted successfully." })
  end
end
