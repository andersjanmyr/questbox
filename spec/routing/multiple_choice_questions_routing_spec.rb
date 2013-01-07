require "spec_helper"

describe QuestionsController do
  describe "routing" do

    it "routes to #new" do
      get("/multiple_choice_questions/new").should route_to("multiple_choice_questions#new")
    end

    it "routes to #show" do
      get("/multiple_choice_questions/1").should route_to("multiple_choice_questions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/multiple_choice_questions/1/edit").should route_to("multiple_choice_questions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/multiple_choice_questions").should route_to("multiple_choice_questions#create")
    end

    it "routes to #update" do
      put("/multiple_choice_questions/1").should route_to("multiple_choice_questions#update", :id => "1")
    end

  end
end
