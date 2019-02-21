# == Schema Information
#
# Table name: responses
#
#  id               :bigint(8)        not null, primary key
#  respondent_id    :integer
#  question_id      :integer
#  answer_choice_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord

  belongs_to :respondent, 
    class_name: :User,
    primary_key: :id,
    foreign_key: :respondent_id
  
  belongs_to :answer_choice,
    class_name: :AnswerChoice,
    primary_key: :id,
    foreign_key: :answer_choice_id


  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses

    question.responses.where.not("responses.id = #{id}")
  end  

  
end
