class Backoffice::AdminsController < ApplicationController
	layout 'backoffice'
	before_action :set_admin, only: [:show, :edit, :update, :destroy]

  def index
  	@admins = Admin.all
  end

  def new
  	@admin = Admin.new
  end

  def create
  	@admin = Admin.new(admin_params)
  	if @admin.save
  		redirect_to backoffice_admins_index_path, :notice => 'Admin criado com sucesso'
  	else
  		render 'new'
  	end
  end

  def show
  end

  def update
  	if @admin.update(admin_params)
  		redirect_to backoffice_admins_index_path, :notice => 'Admin atualizado com sucesso'
  	else
  		render 'edit'
  	end
  end

  def edit
  end

  private

  def admin_params
  	params.require(:admin).permit(:email, :password, :password_confirmation)
  end

  def set_admin
  	@admin = Admin.find(params[:id])
  end


end
