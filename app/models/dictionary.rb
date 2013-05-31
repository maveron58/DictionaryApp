require 'csv'

class Dictionary
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include ActiveModel::Model

  attr_accessor :file
  attr_reader   :errors

  validates :file, presence: true
  validate :filetype
  validate :filesize


  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
    @errors = ActiveModel::Errors.new(self)
  end

  def filesize
    errors.add :file, I18n.t("activemodel.errors.models.dictionary.attributes.file.invalid.filesize") if file && 1000.kilobytes < file.size
  end

  def filetype
    errors.add :file, I18n.t("activemodel.errors.models.dictionary.attributes.file.invalid.filetype") if file && !(file.original_filename =~ %r{.\.((yml)|(csv))$}i)
  end

  def execute
    if file.original_filename =~ %r{.\.yml$}i
      data = YAML.load_file(file.tempfile)
      from = Language.find(data["Dictionary"]["from"]);
      to   = Language.find(data["Dictionary"]["to"]);
      data["Words"].each do |word, definition|
        Word.create(:word => word, :definition => definition, :from => from, :to => to)
      end
    else
      first = true;
      CSV.foreach(file.tempfile) do |row|
        if first
          from = Language.find(row[0])
          to   = Language.find(row[1])
          first = false
        else
          Word.create(:word => row[0], :definition => row[1], :from => from, :to => to)
        end
      end
    end
  end
end