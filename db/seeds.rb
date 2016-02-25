require "random_data" #calls random_data
#Topics creation
15.times do
  Topic.create!(
    name:         RandomData.random_sentence,
    description:  RandomData.random_paragraph
  )
end
topics = Topic.all

15.times do
  SponsoredPost.create!(
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    price: rand(1..100)
  )
end

sponsored_posts = SponsoredPost.all

30.times do
  Post.create!(
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



puts "Seed finished"
puts "#{Post.count} post created"
puts "#{Comment.count} comments created"
puts "#{Topic.count} topics created"
puts "#{SponsoredPost.count} sponsored posts created"
