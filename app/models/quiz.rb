class Quiz
  include Mongoid::Document
  field :name, type: String
  field :randomize_questions, type: Boolean
  field :randomize_answers, type: Boolean
  field :max_times_to_take_quiz, type: Integer
  field :respond_after, type: String
  field :default_theme, type: String
  has_many :questions

  def self.respond_after_types
    [:after_each_question, :after_quiz]
  end

  def self.themes
    %w(Blue Yellow Red)
  end
end
