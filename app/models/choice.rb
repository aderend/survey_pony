class Choice < ActiveRecord::Base
  belongs_to :question
  belongs_to :survey
  has_many :selections

  validates_presence_of :body
end
