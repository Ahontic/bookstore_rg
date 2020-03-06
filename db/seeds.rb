# frozen_string_literal: true

# Seeding Authors
FactoryBot.create_list(:author, 5)
# Seeding Materials
FactoryBot.create_list(:material, 3)
# Seeding Category
categories = ['Mobile Development', 'Photo', 'Web Design']
categories.each { |category| Category.create(title: category) }
# if Rails.env.development?
#   AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
# end

Delivery.create(name: 'Delivery Next Day!', time: '3 to  7 days', price: 5.00)
Delivery.create(name: 'Pick Up In-Store',   time: '5 to 20 days', price: 10.00)
Delivery.create(name: 'Expressit',          time: '2 to  3 days', price: 15.00)

Coupon.create(code: 'TEST',       discount: 0.01)
Coupon.create(code: 'WINTERSALE', discount: 5.00)
Coupon.create(code: 'RUBYGARAGE', discount: 7.50)

def random_cover
  "app/assets/images/image_#{rand(1..3)}.jpg"
end

20.times do
  book = Book.create(
    title: FFaker::Book.title,
    price: rand(10..100),
    quantity: rand(1..10),
    description: FFaker::Book.description,
    depth: rand(1.0..10.0).round(2),
    height: rand(1.0..10.0).round(2),
    width: rand(1.0..10.0).round(2),
    category: Category.all.sample,
    issue_date: rand(1990..2010),
    material: Material.all.sample
  )
  book.images.attach(io: File.open(random_cover), filename: 'cover.jpg',
                     content_type: ['image/png', 'image/jpg', 'image/jpeg'])

  book.authors << Author.order('RANDOM()').first
end
