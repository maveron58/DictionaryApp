class PagesController < ApplicationController
  def index
    @dict = Language.order(:name)
  end

  def dictionary_upload
    @file = params[:file]
    if params[:file]
      @dict = Dictionary.new(:file => params[:file].tempfile, :name => params[:file].original_filename)
    else
      @dict = Dictionary.new()
    end
  end
end
