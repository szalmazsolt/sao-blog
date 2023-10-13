# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.where(email: "zsolo@example.com").first_or_initialize
user.update!(password: "secret", password_confirmation: "secret")

BlogPost.delete_all

1.upto(100) do |i|
  blog_post = BlogPost.where(title: "Blog Post #{i}").first_or_initialize
  blog_post.update!(content: "This is blog post number #{i}.", published_at: Time.now)
end

1.upto(2) do |i|
  BlogPost.create!(title: "Draft Post #{i}", content: "This is a draft post")
end

1.upto(2) do |i|
  BlogPost.create!(title: "Scheduled Post #{i}", content: "This is a scheduled post", published_at: 2.months.from_now)
end
