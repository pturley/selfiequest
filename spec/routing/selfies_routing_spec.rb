require "rails_helper"

RSpec.describe SelfiesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/quests/1/selfies").to route_to("selfies#index", quest_id: "1")
    end

    it "routes to #new" do
      expect(:get => "/quests/1/selfies/new").to route_to("selfies#new", quest_id: "1")
    end

    it "routes to #show" do
      expect(:get => "/quests/1/selfies/2").to route_to("selfies#show", id: "2", quest_id: "1")
    end

    it "routes to #edit" do
      expect(:get => "/quests/1/selfies/2/edit").to route_to("selfies#edit", id: "2", quest_id: "1")
    end

    it "routes to #create" do
      expect(:post => "/quests/1/selfies").to route_to("selfies#create", quest_id: "1")
    end

    it "routes to #update" do
      expect(:put => "/quests/1/selfies/2").to route_to("selfies#update", id: "2", quest_id: "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/quests/1/selfies/2").to route_to("selfies#destroy", id: "2", quest_id: "1")
    end

  end
end
