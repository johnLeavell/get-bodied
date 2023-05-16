# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  ai_messages_count :integer
#  email             :string
#  password_digest   :string
#  username          :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class User < ApplicationRecord
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, presence: true
  has_secure_password
  validates :username, presence: true
  validates :username, uniqueness: true

  has_many :user_workouts, class_name: "UserWorkout", foreign_key: "user_id", dependent: :destroy
  has_many :ai_messages, class_name: "AiMessage", foreign_key: "user_id", dependent: :destroy

  def prompt
    <<~TEXT
      You are the best health and fitness expert, the user will provide questions and personal information to inform you on their fitness goals. Avoid any superfluous pre and post descriptive text. 
      Display each workout as a bullet point and provide a brief summary of each exercise. 
    TEXT
  end

  def api_messages_array
    ai_messages.map { |m| { role: m.role, content: m.content } }.prepend({ role: "system", content: prompt })
  end
end
