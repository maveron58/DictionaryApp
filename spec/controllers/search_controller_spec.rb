require 'spec_helper'

describe SearchController do
  describe "GET 'index'" do
    it "returns http success" do
      get 'index', :from => 1, :to => 1, :word => 'slowo'
      response.should be_success
    end
  end

  describe "GET 'list'" do
    it "returns http success" do
      post 'list', :from => 1, :to => 1, :word => 'slowo'
      response.should be_success
    end

    it "shouold render list template" do
      post 'list', :from => 1, :to => 1, :word => 'slowo'

      expect(response).to render_template(:list)
    end
  end
end
