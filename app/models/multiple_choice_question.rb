class MultipleChoiceQuestion < Question
  field :alternatives, type: Array, default: []
  field :correct_alternative, type: Integer, default: 0
  attr_accessible :alternatives, :correct_alternative

  before_validation :trim_blank_alternatives

  validate :alternatives_must_be_more_than_one, :correct_alternative_must_be_available

  def trim_blank_alternatives
    alternatives.reject! { |a| a.blank? }
  end

  def alternatives_must_be_more_than_one
    if alternatives.size < 2
      errors.add(:alternatives, 'must be more than one')
    end
  end

  def correct_alternative_must_be_available
    if correct_alternative >= alternatives.size
      errors.add(:correct_alternative, 'must be available')
    end
  end
end
