require 'spec_helper'
include ActionDispatch::TestProcess

describe Dictionary do
  before { @dict = Dictionary.new(:file => ActionDispatch::Http::UploadedFile.new(:filename => 'cos.yml', :tempfile => File.new("#{Rails.root}/spec/fixtures/cos.yml"))) }

  subject { @dict }

  it { should respond_to :file }

  it { should be_valid }

  describe "when file is not present" do
    it do
      @dict.file = nil
      expect(@dict).to have(1).error_on(:file)
      expect(@dict.errors_on(:file)).to include(I18n.t("activemodel.errors.models.dictionary.attributes.file.blank"))
    end
  end

  describe "when file type is not allowed" do
    it do
      @dict.file = ActionDispatch::Http::UploadedFile.new :filename => 'img1.png', :tempfile => File.new("#{Rails.root}/spec/fixtures/img1.png")
      expect(@dict).to have(1).error_on(:file)
      expect(@dict.errors_on(:file)).to include(I18n.t("activemodel.errors.models.dictionary.attributes.file.invalid.filetype"))
    end
  end

  describe "when file type is not allowed" do
    it do
      @dict.file = ActionDispatch::Http::UploadedFile.new :filename => 'img2.png', :tempfile => File.new("#{Rails.root}/spec/fixtures/img2.png")
      expect(@dict).to have(2).error_on(:file)
      expect(@dict.errors_on(:file)).to include(I18n.t("activemodel.errors.models.dictionary.attributes.file.invalid.filetype"))
      expect(@dict.errors_on(:file)).to include(I18n.t("activemodel.errors.models.dictionary.attributes.file.invalid.filesize"))
    end
  end

  describe "when file type is not allowed" do
    it do
      @dict.file = ActionDispatch::Http::UploadedFile.new :filename => 'test.zip', :tempfile => File.new("#{Rails.root}/spec/fixtures/test.zip")
      expect(@dict).to have(2).error_on(:file)
      expect(@dict.errors_on(:file)).to include(I18n.t("activemodel.errors.models.dictionary.attributes.file.invalid.filetype"))
      expect(@dict.errors_on(:file)).to include(I18n.t("activemodel.errors.models.dictionary.attributes.file.invalid.filesize"))
    end
  end

  describe "when file type is allowed" do
    it do
      @dict.file = ActionDispatch::Http::UploadedFile.new :filename => 'cos2.csv', :tempfile => File.new("#{Rails.root}/spec/fixtures/cos2.csv")
      expect(@dict).to have(:no).error_on(:file)
    end
  end

  describe "when file type is allowed" do
    it do
      @dict.file = ActionDispatch::Http::UploadedFile.new :filename => 'cos.yml', :tempfile => File.new("#{Rails.root}/spec/fixtures/cos.yml")
      expect(@dict).to have(:no).error_on(:file)
    end
  end

  describe "execute should insert data into database" do
    it do
      @dict.file = ActionDispatch::Http::UploadedFile.new :filename => 'cos.yml', :tempfile => File.new("#{Rails.root}/spec/fixtures/cos.yml")
      @dict.execute

      expect(Word.count).to eq(2)
      expect(Language.count).to eq(2)
    end
  end

  describe "execute should insert data into database" do
    it do
      @dict.file = ActionDispatch::Http::UploadedFile.new :filename => 'cos.yml', :tempfile => File.new("#{Rails.root}/spec/fixtures/cos.yml")
      @dict.execute
      @dict.execute

      expect(Word.count).to eq(4)
      expect(Language.count).to eq(2)
    end
  end

  after(:all) do
    Language.destroy_all
    Word.destroy_all
  end
end
