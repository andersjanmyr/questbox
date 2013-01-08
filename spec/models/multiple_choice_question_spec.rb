require 'spec_helper'

describe MultipleChoiceQuestion do

  describe '#trim_blank_alternatives' do
    it 'removes blank alternatives' do
      question = MultipleChoiceQuestion.new alternatives: ['a', '', nil, 'b']
      question.trim_blank_alternatives
      question.alternatives.should eq(['a', 'b'])
    end
  end

  describe '#alternatives_must_be_more_than_one' do
    it 'is valid for two' do
      question = MultipleChoiceQuestion.new text: 'text', alternatives: ['a', 'b']
      question.should be_valid
    end

    it 'is invalid for one' do
      question = MultipleChoiceQuestion.new text: 'text', alternatives: ['a']
      question.should_not be_valid
    end
  end

  describe '#correct_alternative_must_be_available' do
    it 'is valid correct_alternative=1 with two alternatives' do
      question = MultipleChoiceQuestion.new(
        text: 'text',
        correct_alternative: 1,
        alternatives: ['a', 'b']
      )
      question.should be_valid
    end

    it 'is invalid with correct_alternative=2 with two alternatives' do
      question = MultipleChoiceQuestion.new(
        text: 'text',
        correct_alternative: 2,
        alternatives: ['a', 'b']
      )
      question.should_not be_valid
    end
  end
end
