require "random_data" #calls random_data

20.times do

  Post.create!(

    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

40.times do
  Comment.create!(

    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

puts "#{Post.count}"
Post.find_or_create_by(title: "Iggy's post", body: "Iggy's body... woops!")
puts "#{Post.count}"
puts "----- end adding Post -----"
puts "Comment counts: #{Comment.count}"
Comment.find_or_create_by(body:"Iggy's comment")
puts "Comment counts...again: #{Comment.count}"
puts "----- end adding comment -----"
puts "Seed finished"
puts "#{Post.count} post created"
puts "#{Comment.count} comments created"
