require 'spec_helper'
include ActionDispatch::TestProcess

describe Dictionary do
  before { @dict = Dictionary.new(:file => fixture_file_upload('cos.yml')) }

  subject { @dict }

  it { should respond_to :file }

  it { should be_valid }

  describe "when file is not present" do
    before { @dict.file = nil }
    it { should_not be_valid }
  end

  describe "when file type is not allowed" do
    before { @dict.file = fixture_file_upload('img1.png') }
    it { should_not be_valid }
  end

  describe "when file type is not allowed" do
    before { @dict.file = fixture_file_upload('img2.png') }
    it { should_not be_valid }
  end

  describe "when file type is not allowed" do
    before { @dict.file = fixture_file_upload('test.zip') }
    it { should_not be_valid }
  end

  describe "when file type is allowed" do
    before { @dict.file = fixture_file_upload('cos2.csv') }
    it { should be_valid }
  end

  describe "when file type is allowed" do
    before { @dict.file = fixture_file_upload('cos.yml') }
    it { should be_valid }
  end
end
