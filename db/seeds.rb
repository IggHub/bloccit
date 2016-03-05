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

  Post.create!(
    user: users.sample,
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
    )
end
posts = Post.all

50.times do
  Comment.create!(

    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

user = User.first
user.update_attributes!(
  email: 'igoririanto@rocketmail.com',
  password: 'helloworld'
  )



puts "Seed finished"
puts "#{Post.count} post created"
puts "#{User.count} users created"
puts "#{Comment.count} comments created"
puts "#{Topic.count} topics created"
