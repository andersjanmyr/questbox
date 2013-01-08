class MultipleChoiceQuestion < Question
  field :alternatives, type: Array, default: []
  field :correct_alternative, type: Integer, default: 0
  attr_accessible :alternatives, :correct_alternative
end
