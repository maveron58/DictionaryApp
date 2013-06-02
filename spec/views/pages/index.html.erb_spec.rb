require 'spec_helper'

describe "pages/index.html.erb" do
  it "have dictionary list" do
    data = Array.new()
    data.push({:from => stub_model(Language, :name => 'pl', :from => true), :to => stub_model(Language, :name => 'en', :to => true)})

    assign(:dict, data)

    render

    rendered.should have_selector('h2', :text => I18n.t("welcome_message1"))
    rendered.should have_selector('h3', :text => I18n.t("welcome_message2"))
    rendered.should have_selector('li', :text => 'pl -> en')
  end
end
