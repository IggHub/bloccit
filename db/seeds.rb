require "random_data" #calls random_data

10.times do

  Post.create!(

    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

20.times do
  Comment.create!(

    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

puts "Seed finished"
puts "#{Post.count} post created"
puts "#{Comment.count} comments created"
