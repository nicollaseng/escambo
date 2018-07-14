module Backoffice::AdminsHelper
	OptionsRoles = Struct.new(:key,:value)

	def options_roles
		options = []

		Admin.roles_i18n.each do |key,value|
			options.push(OptionsRoles.new(key,value))
		end

		options
	end
end
