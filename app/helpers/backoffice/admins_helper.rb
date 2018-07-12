module Backoffice::AdminsHelper
	OptionsRoles = Struct.new(:id,:description)

	def options_roles
		options = []

		Admin.roles.each do |key,value|
			options.push(OptionsRoles.new(key,value))
		end

		options
	end
end
