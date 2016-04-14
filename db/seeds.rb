require 'random_data'


 50.times do

   Post.create!(

     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all



 100.times do
   Comment.create!(

     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end

unique_post = Post.find_or_create_by(title: "Unique Title", body: "Unique Body of the Post")
unique_comment = unique_post.comments.find_or_create_by(body: "Unique Comment of the comment ")

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
