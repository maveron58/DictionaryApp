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
      executeFromYml()
    else
      executeFromCsv()
    end
  end

  def executeFromYml
    data = YAML.load_file(file.tempfile)

    from = Language.find_by_name(data["Dictionary"]["from"])
    if !from
      Language.create(:name => data["Dictionary"]["from"])
      from = Language.find_by_name(data["Dictionary"]["from"])
    end
    from.from = true;
    from.save

    to = Language.find_by_name(data["Dictionary"]["to"])
    if !to
      Language.create(:name => data["Dictionary"]["to"])
      to = Language.find_by_name(data["Dictionary"]["to"])
    end
    to.to = true;
    to.save

    data["Words"].each do |word, definition|
      Word.create(:word => word, :definition => definition, :from => from, :to => to)
    end
  end

  def executeFromCsv
    first = true;
    CSV.foreach(file.tempfile) do |row|
      if first
        from = Language.find_by_name(row[0])
        if !from
          Language.create(:name => row[0])
          from = Language.find_by_name(row[0])
        end
        from.from = true;
        from.save

        to = Language.find_by_name(row[1])
        if !to
          Language.create(:name => row[1])
          to = Language.find_by_name(row[1])
        end
        to.to = true;
        to.save

        first = false
      else
        Word.create(:word => row[0], :definition => row[1], :from => from, :to => to)
      end
    end
  end
end