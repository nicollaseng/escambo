class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
 enum role: {:full_acess => 0, :restricted_acess => 1}
   #0 - full acess / 1 - limited acess

  scope :using_escope, -> {where(role:1)}
  #using scope according documentation also using lambda method
  #above could be re-write as 

  # def self.using_escope
  # 	where(role:0)
  # end

  def role_br
  	if self.role == 'full_acess'
  		'Acesso Completo'
  	else
  		'Acesso Restrito'
  	end
  end
end
