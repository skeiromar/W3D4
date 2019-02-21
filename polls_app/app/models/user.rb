# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true

  has_many :polls,
    class_name: :Poll,
    primary_key: :id,
    foreign_key: :author_id 

  has_many :responses,
    class_name: :Response,
    primary_key: :id,
    foreign_key: :respondent_id 
end
