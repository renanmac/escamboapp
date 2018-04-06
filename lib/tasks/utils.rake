namespace :utils do
  desc "Cria Administradores Fake"
  task generate_admins: :environment do
  	puts "Criando Administradores"
  	10.times do
  	Admin.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
  		password: "123456",
  		password_confirmation: "123456")
  	puts "Administradores criados com sucesso!"
  	end
  end
end
