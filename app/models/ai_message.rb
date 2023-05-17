# == Schema Information
#
# Table name: ai_messages
#
#  id         :integer          not null, primary key
#  content    :string
#  role       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class AiMessage < ApplicationRecord
  belongs_to :user, optional: false, class_name: 'User', counter_cache: true

  attribute :role, :string, default: 'user'
  validates :content, presence: true
end
