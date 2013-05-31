require 'spec_helper'

describe Dictionary do
  before { @dict = Dictionary.new(:name => "aaa.yml", :file => "sljfldsjflkjdsflkjsdfl") }

  subject { @dict }

  it { should respond_to :file }
  it { should respond_to :name }

  it { should be_valid }

  describe "when file is not present" do
    before { @dict.file = "" }
    it { should_not be_valid }
  end

  describe "when name is not present" do
    before { @dict.name = "" }
    it { should_not be_valid }
  end

  describe "when file type is not allowed" do
    before { @dict.name = "aaa.img" }
    it { should_not be_valid }
  end

  describe "when file type is not allowed" do
    before { @dict.name = "aaa.gif" }
    it { should_not be_valid }
  end

  describe "when file type is not allowed" do
    before { @dict.name = "aaa.csvcsv" }
    it { should_not be_valid }
  end

  describe "when file type is allowed" do
    before { @dict.name = "aaa.csv" }
    it { should be_valid }
  end

  describe "when file type is allowed" do
    before { @dict.name = "aaa.yml" }
    it { should be_valid }
  end
end
