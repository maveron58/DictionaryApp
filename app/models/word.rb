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

class Word < ActiveRecord::Base
  attr_accessible :definition, :word, :from, :to
  belongs_to :from, :class_name => "Language"
  belongs_to :to, :class_name => "Language"

  validates :definition, presence: true, length: { minimum: 2 }
  validates :word, presence: true, length: { minimum: 2, maximum: 100 }
  validates :from, presence: true
  validates :to, presence: true
end
