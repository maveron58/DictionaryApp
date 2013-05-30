# == Schema Information
#
# Table name: languages
#
#  id   :integer          not null, primary key
#  name :string(255)
#

class Language < ActiveRecord::Base
  attr_accessible :name, :from, :to
  has_many :words

  validates :name, presence: true, length: { minimum: 2, maximum: 2 }
end
