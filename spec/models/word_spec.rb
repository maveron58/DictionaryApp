# == Schema Information
#
# Table name: words
#
#  id         :integer          not null, primary key
#  word       :string(255)      not null
#  definition :text             not null
#  from_id    :integer          not null
#  to_id      :integer          not null
#

require 'spec_helper'

describe Word do
  before do
    @lan1 = Language.new(name: "pl")
    @lan2 = Language.new(name: "en")
    @word = Word.new(word: "slowo", definition: "definicja", from: @lan1, to: @lan2)
  end

  subject { @word }

  it { should respond_to :word }
  it { should respond_to :definition }
  it { should respond_to :from }
  it { should respond_to :to }

  it { should be_valid }

  describe "when word is not present" do
    before { @word.word = "" }
    it { should_not be_valid }
  end

  describe "when definition is not present" do
    before { @word.definition = "" }
    it { should_not be_valid }
  end

  describe "when word is too short" do
    before { @word.word = "a" }
    it { should_not be_valid }
  end

  describe "when word is too long" do
    before { @word.word = "a" * 101 }
    it { should_not be_valid }
  end

  describe "when definition is too short" do
    before { @word.definition = "a" }
    it { should_not be_valid }
  end

  describe "when from is not present" do
    before { @word.from = nil }
    it { should_not be_valid }
  end

  describe "when to is not present" do
    before { @word.to = nil }
    it { should_not be_valid }
  end
end
