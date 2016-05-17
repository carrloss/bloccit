require 'random_data'


 50.times do

   Advertisement.create!(

     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     price:  RandomData.random_integer
   )
 end
 ads = Advertisement.all

 puts "Seed finished"
 puts "#{Advertisement.count} posts created"
