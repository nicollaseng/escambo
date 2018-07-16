class Backoffice::AdminsController < ApplicationController
	layout 'backoffice'
	before_action :set_admin, only: [:show, :edit, :update, :destroy]

  def index
  	@admins = Admin.all #Using escope. Escopes in Admin model
  end

  def new
  	@admin = Admin.new
  	authorize @admin
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
  		AdminMailer.update_email(current_admin, @admin).deliver_now
  		redirect_to backoffice_admins_index_path, :notice => 'Admin atualizado com sucesso'
  	else
  		render 'edit'
  	end
  end

  def edit
  	authorize @admin
  end

  def destroy
  	authorize @admin
  	if @admin.destroy
  		redirect_to backoffice_admins_index_path, :notice => 'Admin excluido com sucesso'
  	else
  		render :edit
  	end
  end

  def pundit_user
  	current_admin
  end

  def admin_modal
  respond_to do |format|
    format.html
    format.js
  end
end

  private

  def admin_params
    if password_blank?
        params[:admin].delete(:password) && params[:admin].delete(:password_confirmation)
      end
  	params.require(:admin).permit(:name,:email, :password, :password_confirmation, :role)
  end

  def set_admin
  	@admin = Admin.find(params[:id])
  end

  def password_blank?
    params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
  end


end
