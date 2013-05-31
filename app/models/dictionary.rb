class Dictionary
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :file, :name
  attr_reader   :errors

  validates :name, presence: true, format: { with: %r{\.(yml|csv)$\z}i }
  validates :file, presence: true
  validate :filesize


  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
    @errors = ActiveModel::Errors.new(self)
  end

  def filesize
    errors[:file] << I18n.t("filesize.validation.error") if file && 1000.kilobytes < file.size
  end
end