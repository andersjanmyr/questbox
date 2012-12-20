class Question
  include Mongoid::Document
  field :text, type: String
  field :alternatives, type: Array
  field :answers, type: Array
  field :extra, type: Hash
end
