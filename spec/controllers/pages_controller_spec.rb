require 'spec_helper'

describe PagesController do
  render_views

  describe "homepage" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "should have the right title (in pl)" do
      get 'index'
      assert_select "title", "Słownik Online - Piotr Heilman"
    end

    it "should have the right title (in pl)" do
      get 'index', :locale => 'pl'
      assert_select "title", "Słownik Online - Piotr Heilman"
    end

    it "should have the right title (in en)" do
      get 'index', :locale => 'en'
      assert_select "title", "Online Dictionary - Piotr Heilman"
    end
  end

end
