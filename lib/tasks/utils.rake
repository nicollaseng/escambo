namespace :utils do
  desc "TODO"
  task adm: :environment do
  	puts "Criando Administradores Fakes...."
  	10.times do
		Admin.create!(name: Faker::Name.name ,email:Faker::Internet.email,
					 password:"123456",password_confirmation: "123456",
					 role: [0,1].sample)
	end
  end

  task members: :environment do
  	puts "Criando Membros Fakes...."
  	10.times do
		Member.create!(name: Faker::Name.name ,email:Faker::Internet.email,
					 password:"123456",password_confirmation: "123456")
	end
  end

   task ads: :environment do
  	puts "Criando Anuncios Fakes...."
  	100.times do
		Ad.create!(title: Faker::Commerce.product_name ,description: Faker::Lorem.paragraph(2),
					category_id: Category.ids.sample, member_id: Member.ids.sample,
          price: "#{Random.rand(500)},#{Random.rand(99)}")
	end
  end

end

