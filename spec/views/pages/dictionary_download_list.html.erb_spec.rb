require 'spec_helper'

describe "pages/dictionary_download_list.html.erb" do
  it "have dictionary list" do
    data = Array.new()
    data.push({:from => stub_model(Language, :name => 'pl', :from => true), :to => stub_model(Language, :name => 'en', :to => true)})

    assign(:data, data)

    render

    rendered.should have_selector('a', :text => 'pl -> en')
    rendered.should have_selector('h3', :text => I18n.t("download.title"))
    rendered.should have_selector('h3', :text => I18n.t("download.yml_format"))
    rendered.should have_selector('h3', :text => I18n.t("download.csv_format"))
  end
end
