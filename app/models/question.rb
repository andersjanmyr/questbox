class Question
  include Mongoid::Document
  field :text, type: String
  field :answers, type: Array
  field :extra, type: Hash
end
