require 'spec_helper'

describe "pages/dictionary_upload.html.erb" do
  it "should have from to upload" do
    assign(:dict, stub_model(Dictionary, :file => ActionDispatch::Http::UploadedFile.new(:filename => 'cos.yml', :tempfile => File.new("#{Rails.root}/spec/fixtures/cos.yml"))))

    render

    rendered.should have_selector('a', :text => I18n.t("upload.look"))
    rendered.should have_selector('a', :text => I18n.t("upload.submit"))
  end
end
