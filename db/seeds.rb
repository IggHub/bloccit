require "random_data" #calls random_data
#Making users
5.times do
  User.create!(
    name: RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )
end
users = User.all

#Topics creation
15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

30.times do

  post = Post.create!(
    user: users.sample,
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
    )

  post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
  rand(1..5).times {post.votes.create!(value: [-1, 1].sample, user: users.sample)}
end
posts = Post.all

50.times do
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

admin = User.create!(
  name: 'AdminMan',
  email: 'admin@bloccit.com',
  password: 'helloyou',
  role: 'admin'
)

member = User.create!(
  name: 'Iggy',
  email: 'igoririanto@rocketmail.com',
  password: 'helloworld'

)
#by default any registered user is a member, unless specified

puts "Seed finished"
puts "#{Post.count} post created"
puts "#{User.count} users created"
puts "#{Comment.count} comments created"
puts "#{Topic.count} topics created"
puts "#{Vote.count} votes created"
