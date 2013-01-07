require "spec_helper"

describe QuestionsController do
  describe "routing" do

    it "routes to #index" do
      get("/questions").should route_to("questions#index")
    end

    it "routes to #destroy" do
      delete("/questions/1").should route_to("questions#destroy", :id => "1")
    end

  end
end
