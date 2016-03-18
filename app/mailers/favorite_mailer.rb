class FavoriteMailer < ApplicationMailer
  default from: 'igoririanto@rocketmail.com'

  def new_comment(user, post, comment)

     headers["Message-ID"] = "<comments/#{comment.id}@igster.herokuapp.com>"
     headers["In-Reply-To"] = "<post/#{post.id}@igster.herokuapp.com>"
     headers["References"] = "<post/#{post.id}@igster.herokuapp.com>"

     @user = user
     @post = post
     @comment = comment

 # #19
     mail(to: user.email, subject: "New comment on #{post.title}")
   end
end
