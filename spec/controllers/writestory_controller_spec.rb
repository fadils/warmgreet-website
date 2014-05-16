require 'spec_helper'

describe WritestoryController do

  describe "GET 'write'" do
    it "returns http success" do
      get 'write'
      response.should be_success
    end
  end

end
