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

  	pswd = params[:admin][:password]
  	pswd_confirmation = params[:admin][:password_confirmation]

  	if pswd.blank? && pswd_confirmation.blank? 
  		params[:admin].delete(:password)
  		params[:admin].delete(:password_confirmation)
  	end

  	if @admin.update(admin_params)
  		redirect_to backoffice_admins_index_path, :notice => 'Admin atualizado com sucesso'
  	else
  		render 'edit'
  	end
  end

  def edit
  end

  def destroy
  	if @admin.destroy
  		redirect_to backoffice_admins_index_path, :notice => 'Admin excluido com sucesso'
  	else
  		render :edit
  	end
  end

  private

  def admin_params
  	params.require(:admin).permit(:email, :password, :password_confirmation)
  end

  def set_admin
  	@admin = Admin.find(params[:id])
  end


end
