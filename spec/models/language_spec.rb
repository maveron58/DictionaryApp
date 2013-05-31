# == Schema Information
#
# Table name: languages
#
#  id   :integer          not null, primary key
#  name :string(255)      not null
#  from :boolean          default(FALSE), not null
#  to   :boolean          default(FALSE), not null
#

require 'spec_helper'

describe Language do
  before { @language = Language.new(name: "pl") }

  subject { @language }

  it { should respond_to :name }
  it { should respond_to :id }

  it { should be_valid }

  describe "when name is not present" do
    before { @language.name = "" }
    it { should_not be_valid }
  end

  describe "when name is too short" do
    before { @language.name = "a" }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @language.name = "a" * 3 }
    it { should_not be_valid }
  end
end
