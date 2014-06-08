require 'spec_helper'

describe AboutController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should render_template("index")
    end
  end

end
