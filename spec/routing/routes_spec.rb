require 'spec_helper'

describe "routing" do
  describe "AboutController" do

	it "routes to #index" do
  	    get("/about/index").should route_to("about#index")
    end
  end
end