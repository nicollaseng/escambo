class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:full_acess, :restricted_acess]

  def role_br
  	if self.role == 'full_acess'
  		'Acesso Completo'
  	else
  		'Acesso Restrito'
  	end
  end
end
