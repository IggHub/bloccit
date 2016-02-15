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
 #----------------------------------------
 #----------------------------------------

 10.times do

   Advertisement.create!(

     title: RandomData.random_sentence,
     copy: RandomData.random_paragraph,
     price: RandomData.random_number
   )
 end
 advertisements = Advertisement.all

puts "Advertisement finished seeding"
puts "#{Advertisement.count} advertisements created"
