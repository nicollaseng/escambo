namespace :utils do
  desc "TODO"
  task adm: :environment do
  	puts "Criando Administrador Padrão"
	Admin.create!(name:"Administrador",email:"admin.geral@escambo.com",
				 password:"123456",password_confirmation: "123456")
  end

end
