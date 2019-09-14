module PostsHelper
  def render_post_content(post)
    simple_format(truncate(strip_tags(post.content), length: 25))
  end
end
