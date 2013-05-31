class PagesController < ApplicationController
  def index
    @dict = Language.order(:name)
  end

  def dictionary_upload
    @file = params[:file]
    if params[:dictionary]
      @dict = Dictionary.new(params[:dictionary])
    else
      @dict = Dictionary.new()
    end

    if @dict.valid?
      @dict.execute
    end
  end
end
