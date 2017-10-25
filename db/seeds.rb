def copy_image_fixture(file_name, id)
  dir = Rails.root.join('public', 'uploads')
  Dir.mkdir(dir) unless File.directory?(dir)
  FileUtils.cp(file_name, dir.join(id.to_s))
end

cpus_category = Category.create(name_en: 'CPUs', name_ru: "Процессоры")
motherboards_category = Category.create(name_en: 'Motherboards', name_ru: "Мат. платы")
ram_category = Category.create(name_en: 'RAM', name_ru: "Оперативная память")
hdd_category = Category.create(name_en: 'HDDs', name_ru: "Жесткие диски")

fixtures_category = Category.create(name_en: 'Fixtures', name_ru: "Фикстуры" )

fixtures_path = Rails.root.join('app', 'assets', 'images', 'fixtures')

cpu = Product.create(title_en: 'Intel Core i7',
										title_ru: 'Процессор Intel Core i7',
										price: 300, 
										description_en: Faker::Lorem.paragraph,
										description_ru: Faker::Lorem.paragraph,
										category: cpus_category)
copy_image_fixture(fixtures_path.join('cpu.jpg'), cpu.id)

ram = Product.create(title_en: '4GB DDR3 RAM',
										title_ru: '4GB DDR3 ОЗУ',
										price: 40, 
										description_en: Faker::Lorem.paragraph, 
										description_ru: Faker::Lorem.paragraph,
										category: ram_category)
copy_image_fixture(fixtures_path.join('ram.jpg'), ram.id)

hdd = Product.create(title_en: '1TB Seagate HDD',
										title_ru: '1TB Seagate ЖД', 
										price: 60, 
										description_en: Faker::Lorem.paragraph,
										description_ru: Faker::Lorem.paragraph, 
										category: hdd_category)
copy_image_fixture(fixtures_path.join('hdd.jpg'), hdd.id)

mb = Product.create(title_en: 'Asus P5Q3', 
										title_ru: 'Asus P5Q5 МП',
										price: 120, 
										description_en: Faker::Lorem.paragraph, 
										description_ru: Faker::Lorem.paragraph,
										category: motherboards_category)
copy_image_fixture(fixtures_path.join('mb.jpg'), mb.id)

50.times do
  Product.create(title_en: Faker::Commerce.product_name,
  							 title_ru: Faker::Commerce.product_name,
                 price: Faker::Commerce.price,
                 description_en: Faker::Lorem.paragraph,
                 description_ru: Faker::Lorem.paragraph,
                 category: fixtures_category)
end

user = User.create(name: 'John Doe', email: 'johndoe@example.com', password: '12345678', password_confirmation: '12345678')
admin_user = User.create(name: 'Admin', email: 'admin@example.com', password: 'adminadmin', password_confirmation: 'adminadmin', admin: true)