class Backoffice::CategoryController < ApplicationController
	before_action :find_category, only: [:edit, :update]
	before_action :authenticate_admin!
	layout 'backoffice'
  
  def index
  	@categories = Category.all
  end

  def new
  	@category = Category.new
  end

  def edit
  end

  def create
  	@category = Category.new(category_params)
  	if @category.save
  		redirect_to backoffice_category_index_path, :notice => "Categoria #{@category.description} criada com sucesso!"
  	else
  		render'new'
  	end
  end

  def update
  	if @category.update(category_params)
  		redirect_to  backoffice_category_index_path, :notice => "Categoria #{@category.description} atualizada com sucesso!" 	
  	else
  		render 'edit'
  	end
  end	

  private

  def find_category
  	@category = Category.find(params[:id])
  end

  def category_params
  	params.require(:category).permit(:id, :description)
  end 

end
