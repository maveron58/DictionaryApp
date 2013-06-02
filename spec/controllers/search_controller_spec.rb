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
      get 'list', :from => 1, :to => 1, :word => 'slowo'
      response.should be_success
    end
  end

end
