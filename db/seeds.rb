# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username:"admin", email: "admin@admin.com", is_admin: true, password: "password")

5.times do

User.create(username: Faker::Internet.user_name, email: Faker::Internet.safe_email, is_admin: false, password: "password")

end

Category.create(title: "Saddles", admin_id: 1)
Category.create(title: "Horse Names", admin_id: 1)
Category.create(title: "Horse Breeds", admin_id: 1)
Category.create(title: "Horse Hair", admin_id: 1)
#1
Article.create(is_published: true, click_count: rand(1..10), is_featured:  true ,published_version_id: 1)

Version.create(title: "The Best Type of Saddles", body: Faker::Lorem.paragraph(2), photo_url: "https://images2.onionstatic.com/clickhole/3567/5/original/600.jpg" ,article_id: 1, author_id: rand(1..6))
#2
Article.create(is_published: false,  click_count: rand(1..10), is_featured: false, published_version_id: nil)

Version.create(title: "The Worst Saddles", body: Faker::Lorem.paragraph(2), photo_url: "https://i.ytimg.com/vi/8MQ6aHPO7PQ/maxresdefault.jpg", article_id: 2, author_id: rand(1..6))

#3
Article.create(is_published: true, click_count: rand(1..10), is_featured: false, published_version_id: 3  )

Version.create(title: "Best Horse Names", body: Faker::Lorem.paragraph(2), photo_url: "https://i.pinimg.com/736x/8c/87/f1/8c87f181412dd85b618ffa21da105ed3.jpg", article_id: 3 ,author_id: rand(1..6))

#4
Article.create(is_published: true, click_count: rand(1..10), is_featured: false, published_version_id: 4)

Version.create(title: "Best Horse Person Names", body: Faker::Lorem.paragraph(2),photo_url: "https://i.ytimg.com/vi/y1U1Eqfdg7w/maxresdefault.jpg", article_id: 4 ,author_id: rand(1..6))

#5
Article.create(is_published: true, click_count: rand(1..10), is_featured: false, published_version_id: 5)

Version.create(title: "The Best Breeds", body: Faker::Lorem.paragraph(2), photo_url: "https://s-i.huffpost.com/gen/1758711/images/o-HORSE-facebook.jpg", article_id: 5 ,author_id: rand(1..6))

#6
Article.create(is_published: true, click_count: rand(1..10), is_featured: false, published_version_id: 6)

Version.create(title: "The Worst Breeds", body: Faker::Lorem.paragraph(2), photo_url: "http://www.petermeadephotography.com/img/s/v-3/p1430042462-3.jpg", article_id: 6 ,author_id: rand(1..6))


CategoryArticle.create(category_id: 1, article_id: 1)
CategoryArticle.create(category_id: 1, article_id: 2)
CategoryArticle.create(category_id: 2, article_id: 3)
CategoryArticle.create(category_id: 2, article_id: 4)
CategoryArticle.create(category_id: 3, article_id: 5)
CategoryArticle.create(category_id: 3, article_id: 6)






