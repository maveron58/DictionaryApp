class SearchController < ApplicationController
  def index
    @arg1 = params[:from]
    @arg2 = params[:to]
    @arg3 = params[:word]

    @wynik = Word.where("from_id = :f AND to_id = :t AND word = :w", {:f => params[:from], :t => params[:to], :w => params[:word] }).first()
  end

  def list
  end
end
