class Question
  extend ActiveSupport::DescendantsTracker
  include Mongoid::Document
  attr_accessor :question_type

  field :text, type: String
  field :answers, type: Array
  field :extra, type: Hash
  belongs_to :quiz

  def self.question_types
    [MultipleChoiceQuestion, FillInTheBlanksQuestion]
  end

  def to_s
    text
  end
end
