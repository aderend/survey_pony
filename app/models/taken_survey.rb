class TakenSurvey < ActiveRecord::Base
  belongs_to :survey
  belongs_to :taker, class_name: :User
  has_many :selections

  def taken_summary
    selections.map.with_object({}) do |selection, hash|
      hash[selection.choice.question.body] = selection.choice.body
    end
  end
end