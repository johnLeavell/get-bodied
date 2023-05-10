# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  ai_messages_count :integer
#  email             :string
#  password_digest   :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:user_workouts, { :class_name => "UserWorkout", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:ai_messages, { :class_name => "AiMessage", :foreign_key => "user_id", :dependent => :destroy })

  def prompt
    <<~TEXT
      You are the best health and fitness expert.
      Take the following information about me and create a custom exercise plan based off my specifications.
      Display each workout as a bullet point and provide a brief summary of each exercise.

    TEXT
  end
end
