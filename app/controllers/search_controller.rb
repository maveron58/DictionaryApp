class SearchController < ApplicationController
  def index
    @from = Language.find(params[:from]).name
    @to = Language.find(params[:to]).name
    @word = params[:word]

    @wynik = Word.where("from_id = :f AND to_id = :t AND word = :w", {:f => params[:from], :t => params[:to], :w => params[:word] }).all
  end

  def list
    @result = Word.where("from_id = :f AND to_id = :t AND word LIKE :w", {:f => params[:from], :t => params[:to], :w => params[:word] + '%' }).limit(10)
    render :layout => false
  end
end
