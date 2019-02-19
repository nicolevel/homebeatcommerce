class SearchesController < ApplicationController
  def new
  @search = Search.new
  # @categories = Item.uniq.pluck(:category)
  end

  def create
  @search = Search.create(search_params)
  redirect_to @search
  end

  def show
  @search = Search.find(params[:id])
  end

# def audiovideo
#   @search = Search.find(params[:key_features]) == 'Audio Video'
# end

  private

  def search_params
    params.require(:search).permit(:categoria, :min_price, :max_price, :marca, :color, :features)
  end
end
