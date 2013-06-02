class PagesController < ApplicationController
  def index
    @dict = getDictionaries
  end

  def dictionary_upload
    @mess = nil
    if params[:dictionary]
      @dict = Dictionary.new(params[:dictionary])
    else
      @dict = Dictionary.new()
    end

    if @dict.valid?
      @dict.execute
      @mess = t("upload.done")
    end
  end

  def dictionary_download
    from = Language.find_by_name_and_from(params[:from], true)
    to = Language.find_by_name_and_to(params[:to], true)

    if !(from && to)
      render "no_dictionary"
    else
      name = "dictionary_from_" + from.name + "_to_" + to.name + "." + params[:type]
      data = Word.find_all_by_from_id_and_to_id(from.id, to.id)

      if params[:type] == 'yml'
        File.open(name, "w+") do |file|
          file.write("Dictionary\n")
          file.write("  from: " + from.name + "\n")
          file.write("  to: " + to.name + "\n")
          file.write("Words\n")
          data.each do |w|
            file.write("  " + w.word + ": " + w.definition + "\n")
          end
        end
      else
        File.open(name, "w+") do |file|
          file.write(from.name + "," + to.name + "\n")
          data.each do |w|
            file.write(w.word + "," + w.definition + "\n")
          end
        end
      end

      send_file name
    end
  end

  def dictionary_download_list
    @data = getDictionaries
  end

  def getDictionaries
    langs = Language.all
    data = Array.new()

    if langs
      langs.each do |from|
        next if !from.from
        langs.each do |to|
          next if !to.to

          exist = Word.find_by_from_id_and_to_id(from.id, to.id)
          if exist
            data.push({:from => from, :to => to})
          end
        end
      end
    end

    return data
  end
end
