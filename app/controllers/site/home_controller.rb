class Site::HomeController < ApplicationController
	layout 'site'

  def index
  	@categories = Category.order(:description)
  	@ads = Ad.order(:title).page(params[:page]).per(6)
  end
end
