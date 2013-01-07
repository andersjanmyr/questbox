require 'spec_helper'

describe MultipleChoiceQuestionsController do

  def valid_attributes
    { "text" => "MyString" }
  end

  def valid_session
    {}
  end

  describe "GET show" do
    it "assigns the requested question as @multiple_choice_question" do
      question = MultipleChoiceQuestion.create! valid_attributes
      get :show, {:id => question.to_param}, valid_session
      assigns(:multiple_choice_question).should eq(question)
    end
  end

  describe "GET new" do
    it "assigns a new question as @multiple_choice_question" do
      get :new, {}, valid_session
      assigns(:multiple_choice_question).should be_a_new(MultipleChoiceQuestion)
    end
  end

  describe "GET edit" do
    it "assigns the requested question as @multiple_choice_question" do
      question = MultipleChoiceQuestion.create! valid_attributes
      get :edit, {:id => question.to_param}, valid_session
      assigns(:multiple_choice_question).should eq(question)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Question" do
        expect {
          post :create, {:multiple_choice_question => valid_attributes}, valid_session
        }.to change(Question, :count).by(1)
      end

      it "assigns a newly created question as @question" do
        post :create, {:multiple_choice_question => valid_attributes}, valid_session
        assigns(:question).should be_a(MultipleChoiceQuestion)
        assigns(:question).should be_persisted
      end

      it "redirects to the created question" do
        post :create, {:multiple_choice_question => valid_attributes}, valid_session
        response.should redirect_to(Question.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved question as @question" do
        # Trigger the behavior that occurs when invalid params are submitted
        MultipleChoiceQuestion.any_instance.stub(:save).and_return(false)
        post :create, {:multiple_choice_question => { "text" => "invalid value" }}, valid_session
        assigns(:question).should be_a_new(MultipleChoiceQuestion)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        MultipleChoiceQuestion.any_instance.stub(:save).and_return(false)
        post :create, {:multiple_choice_question => { "text" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested question" do
        question = MultipleChoiceQuestion.create! valid_attributes
        # Assuming there are no other questions in the database, this
        # specifies that the Question created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        MultipleChoiceQuestion.any_instance.should_receive(:update_attributes).with({ "text" => "MyString" })
        put :update, {:id => question.to_param, :multiple_choice_question => { "text" => "MyString" }}, valid_session
      end

      it "assigns the requested question as @question" do
        question = Question.create! valid_attributes
        put :update, {:id => question.to_param, :multiple_choice_question => valid_attributes}, valid_session
        assigns(:question).should eq(question)
      end

      it "redirects to the question" do
        question = MultipleChoiceQuestion.create! valid_attributes
        put :update, {:id => question.to_param, :multiple_choice_question => valid_attributes}, valid_session
        response.should redirect_to(question)
      end
    end

    describe "with invalid params" do
      it "assigns the question as @question" do
        question = MultipleChoiceQuestion.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        MultipleChoiceQuestion.any_instance.stub(:save).and_return(false)
        put :update, {:id => question.to_param, :multiple_choice_question => { "text" => "invalid value" }}, valid_session
        assigns(:question).should eq(question)
      end

      it "re-renders the 'edit' template" do
        question = MultipleChoiceQuestion.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        MultipleChoiceQuestion.any_instance.stub(:save).and_return(false)
        put :update, {:id => question.to_param, :multiple_choice_question => { "text" => "invalid value" }}, valid_session
        pp response
        response.should render_template("edit")
      end
    end
  end

end

