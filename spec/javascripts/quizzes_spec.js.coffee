#= require quizzes
#
describe 'Quiz', ->

  it 'should have no questions', ->
    quiz = new Quiz()
    expect(quiz.questions.length).to.be(0)
