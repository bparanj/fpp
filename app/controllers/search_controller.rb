class SearchController < ApplicationController
  def index
    @products = if params[:q].nil?
      []
    else
      Product.search(params[:q])
    end
  end
end