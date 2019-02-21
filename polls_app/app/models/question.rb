# == Schema Information
#
# Table name: questions
#
#  id         :bigint(8)        not null, primary key
#  text       :string
#  poll_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  validates :text, uniqueness: {scope: :poll_id}, presence: true
  
  belongs_to :poll,
  class_name: :Poll,
  primary_key: :id,
  foreign_key: :poll_id

  has_many :answer_choices,
  class_name: :AnswerChoice, 
  primary_key: :id,
  foreign_key: :question_id

  has_many :responses,
    through: :answer_choices,
    source: :responses
end
