require 'spec_helper'

describe "routing" do
  describe "AboutController" do
	it "routes to #index" do
  	    get("/about/index").should route_to("about#index")
    end
  end

  describe "GuidelineController" do
	it "routes to #index" do
  	    get("/guideline/index").should route_to("guideline#index")
    end
  end
end