module PostsHelper
   def check_vlidation(post)
    post.title if post && post.body.present?
  end
end
