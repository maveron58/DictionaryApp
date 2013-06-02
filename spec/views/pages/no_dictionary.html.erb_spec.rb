require 'spec_helper'

describe "pages/no_dictionary.html.erb" do
  it "displays no dicionary" do
    render

    rendered.should have_selector("p", :text => I18n.t("dictionary.not_found"))
  end
end
