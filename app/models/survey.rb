class Survey < ActiveRecord::Base
  belongs_to :creator, class_name: :User
  has_many :questions
  has_many :choices, through: :questions
  has_many :taken_surveys

  validates_presence_of :title

  def next_question(current_question)
    questions.find_by(id:current_question.id+1)
  end

  def total_takers
    taken_surveys.count
  end

  def num_times_chosen(choice)
    choices.find_by(id: choice.id).selections.count
  end

  def percentage(choice)
    return 0 if total_takers == 0
    num = num_times_chosen(choice)
    ((num/(total_takers * 1.0))*100).round(2)
  end
end
