class SearchController < ApplicationController
  def index
    @from = Language.find_by_id(params[:from])
    if @from
      @from = @from.name
    else
      @from = 'error'
    end
    @to = Language.find_by_id(params[:to])
    if @to
      @to = @to.name
    else
      @to = 'error'
    end
    @word = params[:word]

    @wynik = Word.where("from_id = :f AND to_id = :t AND word = :w", {:f => params[:from], :t => params[:to], :w => params[:word] })
  end

  def list
    @result = Word.where("from_id = :f AND to_id = :t AND word LIKE :w", {:f => params[:from], :t => params[:to], :w => params[:word] + '%' }).limit(10)
    render :layout => false
  end
end
