module Backoffice::AdminsHelper
	OptionsRoles = Struct.new(:key,:value)

	def options_roles
		Admin.roles_i18n.map do |key,value|
			OptionsRoles.new(key,value)
		end
	end
end
