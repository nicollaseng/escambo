# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

	puts "Cadastrando Categorias"
 categories = ["Acessórios para Veículos",
 "Agro, Indústria e Comércio",
 "Alimentos e Bebidas",
 "Animais ",
 "Antiguidades",
 "Arte e Artesanato", 
 "Bebês",
 "Beleza e Cuidado Pessoal ",
 "Brinquedos e Hobbies", 
 "Câmeras e Acessórios",
 "Calçados, Roupas e Bolsas",
 "Casa, Móveis e Decoração",
 "Celulares e Telefones", 
 "Eletrodomésticos", 
 "Eletrônicos, Áudio e Vídeo",
 "Esportes e Fitness", 
 "Games ",
 "Informática"] 

 categories.each do |category|
 	Category.find_or_create_by!(description: category)
 end

 puts "Categorias cadastradas com sucesso"