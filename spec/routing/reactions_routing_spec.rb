require "rails_helper"

RSpec.describe ReactionsController, type: :routing do
  describe "routing" do

    it "routes to #create" do
      expect(:post => "/reactions").to route_to("reactions#create")
    end

    it "routes to #destroy" do
      expect(:delete => "/reactions/1").to route_to("reactions#destroy", :id => "1")
    end

  end
end
