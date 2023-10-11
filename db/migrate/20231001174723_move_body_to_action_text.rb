class MoveBodyToActionText < ActiveRecord::Migration[7.0]
  def change
    # We need to move the body column content to the content column (this need to be done for ActionText)
    # find_each takes a bunch os posts (about 1000 posts at a time)
    BlogPost.all.find_each do |blog_post|
      # assign the content of the body to the a new attribute 'content'
      blog_post.update(content: blog_post.body)
    end

    # after this, we can remove the body column from the blog_posts table
    remove_column :blog_posts, :body
  end
end
