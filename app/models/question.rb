class Question
  extend ActiveSupport::DescendantsTracker
  include Mongoid::Document
  attr_accessor :question_type

  field :text, type: String
  field :extra, type: Hash
  belongs_to :quiz

  validates_presence_of :text

  def self.question_types
    [MultipleChoiceQuestion, FillInTheBlanksQuestion]
  end

  def question_type
    self.class
  end

  def to_s
    text
  end
end
