require "random_data" #calls random_data

10.times do

  Question.create!(

    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    resolved: false
  )
end
questions = Question.all
=begin
20.times do
  Comment.create!(

    post: posts.sample,
    body: RandomData.random_paragraph
  )
end
=end
puts "Seed finished"
puts "#{Question.count} questions created"
#puts "#{Comment.count} comments created"
