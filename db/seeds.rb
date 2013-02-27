require 'faker'

20.times do 
  User.create :name => Faker::Name.name,
              :email => Faker::Internet.email

  Post.create :link    => Faker::Internet.url,
              :title   => Faker::Lorem.words(num = 3),
              :user_id => rand(1..20)

  Comment.create  :body => Faker::Lorem.sentences(5),
                  :user_id => rand(1..20),
                  :post_id => rand(1..20)

  PostVote.create :post_id => rand(1..20),
                  :user_id => rand(1..20)

  CommentVote.create :comment_id => rand(1..20),
                     :user_id    => rand(1..20)

end

