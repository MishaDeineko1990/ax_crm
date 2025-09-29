# # This file should ensure the existence of records required to run the application in every environment (production,
# # development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# puts "🌱 Початок створення тестових даних..."

# # Очищення існуючих даних (опціонально)
# puts "🧹 Очищення існуючих даних..."
# Good.destroy_all
# Sale.destroy_all
# Persson.destroy_all
# Organization.destroy_all
# OueOrganization.destroy_all
# SaleOrganization.destroy_all
# Tovar.destroy_all
# Tag.destroy_all
# User.destroy_all

# Створення користувачів
puts "👥 Створення користувачів..."
users = []
2.times do |i|
  user = User.create!(
    email: "user#{i+1}@example.com",
    password: "252525",
    password_confirmation: "252525",
    name: "Користувач #{i+1}",
    role: rand(0..2) # припускаючи, що role це enum
  )
  users << user
  puts "  ✅ Створено користувача: #{user.email}"
end


# # Створення організацій
# puts "🏢 Створення організацій..."
# organizations = []
# 5.times do |i|
#   org = Organization.create!(
#     name: "ТОВ \"Компанія #{i+1}\"",
#     short_name: "Компанія#{i+1}",
#     ederpou: "#{12345678 + i}",
#     ipn: "#{123456789 + i}0",
#     type_rent: ["Загальна", "Спрощена", "Єдиний податок"].sample,
#     factic_address: "м. Київ, вул. Хрещатик, #{i+1}",
#     legal_address: "м. Київ, вул. Хрещатик, #{i+1}",
#     send_adress: "м. Київ, вул. Хрещатик, #{i+1}",
#     number_count_bank: "UA#{rand(100000000000000000000000000)..999999999999999999999999999}",
#     mfo: "#{300000 + i}",
#     name_and_requisites_bank: "ПриватБанк, МФО #{300000 + i}",
#     phone: "+380#{rand(100000000..999999999)}",
#     mail: "company#{i+1}@example.com",
#     user: users.sample
#   )
#   organizations << org
#   puts "  ✅ Створено організацію: #{org.name}"
# end

# # Створення зовнішніх організацій (OueOrganization)
# puts "🏭 Створення зовнішніх організацій..."
# oue_organizations = []
# 5.times do |i|
#   oue_org = OueOrganization.create!(
#     name: "ПП \"Зовнішня компанія #{i+1}\"",
#     short_name: "ЗовКомп#{i+1}",
#     ederpou: "#{87654321 + i}",
#     ipn: "#{987654321 + i}0",
#     type_rent: ["Загальна", "Спрощена", "Єдиний податок"].sample,
#     factic_address: "м. Львів, вул. Свободи, #{i+1}",
#     legal_address: "м. Львів, вул. Свободи, #{i+1}",
#     send_adress: "м. Львів, вул. Свободи, #{i+1}",
#     number_count_bank: "UA#{rand(100000000000000000000000000)..999999999999999999999999999}",
#     mfo: "#{320000 + i}",
#     name_and_requisites_bank: "Ощадбанк, МФО #{320000 + i}",
#     phone: "+380#{rand(100000000..999999999)}",
#     mail: "external#{i+1}@example.com"
#   )
#   oue_organizations << oue_org
#   puts "  ✅ Створено зовнішню організацію: #{oue_org.name}"
# end

# # Створення організацій для продажу (SaleOrganization)
# puts "💼 Створення організацій для продажу..."
# sale_organizations = []
# 5.times do |i|
#   sale_org = SaleOrganization.create!(
#     name: "ФОП \"Продавець #{i+1}\"",
#     short_name: "Продавець#{i+1}",
#     ederpou: "#{11111111 + i}",
#     ipn: "#{111111111 + i}0",
#     type_rent: ["Загальна", "Спрощена", "Єдиний податок"].sample,
#     factic_address: "м. Одеса, вул. Дерибасівська, #{i+1}",
#     legal_address: "м. Одеса, вул. Дерибасівська, #{i+1}",
#     send_adress: "м. Одеса, вул. Дерибасівська, #{i+1}",
#     number_count_bank: "UA#{rand(100000000000000000000000000)..999999999999999999999999999}",
#     mfo: "#{340000 + i}",
#     name_and_requisites_bank: "ПУМБ, МФО #{340000 + i}",
#     phone: "+380#{rand(100000000..999999999)}",
#     mail: "seller#{i+1}@example.com"
#   )
#   sale_organizations << sale_org
#   puts "  ✅ Створено організацію для продажу: #{sale_org.name}"
# end

# # Створення персон
# puts "👤 Створення персон..."
# perssons = []
# 5.times do |i|
#   persson = Persson.create!(
#     first_name: ["Олександр", "Марія", "Іван", "Анна", "Петро"][i],
#     last_name: ["Петренко", "Іваненко", "Сидоренко", "Коваленко", "Шевченко"][i],
#     father_name: ["Іванович", "Петрівна", "Олександрович", "Миколаївна", "Васильович"][i],
#     name_for_contract: "#{["Олександр", "Марія", "Іван", "Анна", "Петро"][i]} #{["Петренко", "Іваненко", "Сидоренко", "Коваленко", "Шевченко"][i]}",
#     phone: "+380#{rand(100000000..999999999)}",
#     email: "person#{i+1}@example.com",
#     send_adress: "м. Харків, вул. Сумська, #{i+1}",
#     role: ["Директор", "Менеджер", "Бухгалтер", "Юрист", "Консультант"].sample,
#     birth_data: Date.new(1980 + rand(30), rand(1..12), rand(1..28)),
#     note_data: "Примітка для персони #{i+1}",
#     other_data: "Додаткові дані #{i+1}",
#     user: users.sample,
#     organization: organizations.sample
#   )
#   perssons << persson
#   puts "  ✅ Створено персону: #{persson.first_name} #{persson.last_name}"
# end

# # Створення тегів
# puts "🏷️ Створення тегів..."
# tags = []
# 5.times do |i|
#   tag = Tag.create!(
#     t1: "Категорія#{i+1}"
#   )
#   tags << tag
#   puts "  ✅ Створено тег: #{tag.t1}"
# end

# # Створення товарів
# puts "📦 Створення товарів..."
# tovars = []
# 5.times do |i|
#   tovar = Tovar.create!(
#     length: rand(10..100),
#     width: rand(10..100),
#     height: rand(10..100),
#     name: "Товар #{i+1}",
#     weight: "#{rand(1..50)} кг",
#     price: "#{rand(100..10000)} грн",
#     description: "Опис товару #{i+1}. Високоякісний продукт з відмінними характеристиками.",
#     image: "tovar#{i+1}.jpg",
#     tags: "тег1,тег2,тег3",
#     custom_data: "Користувацькі дані #{i+1}",
#     other_data: "Інші дані #{i+1}"
#   )
#   # Додаємо зв'язки з тегами
#   tovar.tags << tags.sample(rand(1..3))
#   tovars << tovar
#   puts "  ✅ Створено товар: #{tovar.name}"
# end

# # Створення продажів
# puts "💰 Створення продажів..."
# sales = []
# 5.times do |i|
#   sale = Sale.create!(
#     status: rand(0..3), # припускаючи, що status це enum
#     note: "Примітка до продажу #{i+1}",
#     other_data: "Додаткові дані продажу #{i+1}",
#     user: users.sample,
#     organization: organizations.sample,
#     oue_organization: oue_organizations.sample,
#     persson: perssons.sample
#   )
#   sales << sale
#   puts "  ✅ Створено продаж: ID #{sale.id}"
# end

# # Створення товарів для продажу
# puts "🛍️ Створення товарів для продажу..."
# 5.times do |i|
#   good = Good.create!(
#     length: rand(10..100),
#     width: rand(10..100),
#     height: rand(10..100),
#     name: "Товар для продажу #{i+1}",
#     weight: "#{rand(1..50)} кг",
#     price: "#{rand(100..10000)} грн",
#     description: "Опис товару для продажу #{i+1}. Готовий до реалізації.",
#     image: "good#{i+1}.jpg",
#     tags: "продаж,товар,якість",
#     custom_data: "Користувацькі дані товару #{i+1}",
#     other_data: "Інші дані товару #{i+1}",
#     sale: sales.sample
#   )
#   puts "  ✅ Створено товар для продажу: #{good.name}"
# end

# puts ""
# puts "🎉 Тестові дані успішно створено!"
# puts "📊 Статистика:"
# puts "   👥 Користувачі: #{User.count}"
# puts "   🏢 Організації: #{Organization.count}"
# puts "   🏭 Зовнішні організації: #{OueOrganization.count}"
# puts "   💼 Організації для продажу: #{SaleOrganization.count}"
# puts "   👤 Персони: #{Persson.count}"
# puts "   🏷️ Теги: #{Tag.count}"
# puts "   📦 Товари: #{Tovar.count}"
# puts "   💰 Продажі: #{Sale.count}"
# puts "   🛍️ Товари для продажу: #{Good.count}"
# puts ""
# puts "✅ Готово! Можете використовувати команду: rails db:seed"
