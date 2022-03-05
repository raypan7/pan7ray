namespace :dev do
  task fake: :environment do

    users = []
    users << User.create!(email: 'admin@example.com', password: '12345678', role: 'admin')
    users << User.create!(email: 'hacker@example.com', password: '12345678')
    users << User.create!(email: 'ray.pan@example.com', password: '12345678')

    10.times do |i|
      post = Post.create!(
        name: "FakePost-#{i}",
        description: "This is FakePost description-#{i}",
        user_id: users.sample.id,
      )
      puts "Generate FakePost #{i}"
      10.times do |j|
        post.comments.create!(user_id: users.sample.id, content: "FakeContent-#{j}")
      end
    end

    products = []
    10.times do |i|
      products << Product.create!(
        title: "FakeProduct-#{i}",
        description: "This is FakeProduct description-#{i}",
        price: (rand(100)+1) * 10,
      )
    end

    users.size.times do
      cart = Cart.create!
      cart.add_product_to_cart(products.sample)
      cart.add_product_to_cart(products.sample)
      cart.add_product_to_cart(products.sample)
    end
  end
end
