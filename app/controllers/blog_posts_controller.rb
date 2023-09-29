class BlogPostsController < ApplicationController

  before_action :requires_login, except: [:index, :show]
  before_action :set_blog_post, except: [:index, :new, :create]

  def index
    @blog_posts = user_logged_in? ? BlogPost.sort_by_status.latest_first : BlogPost.published
  end

  def show
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
      redirect_to @blog_post
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
  end

  def update
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog_post.destroy
    redirect_to blog_posts_url, notice: "Blog post was deleted"
  end

  private

    def set_blog_post
      begin
        @blog_post = user_logged_in? ? BlogPost.find(params[:id]) : BlogPost.published.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to root_url
      end
      
    end

    def blog_post_params
      params
        .require(:blog_post)
        .permit(:title, :body, :published_at)
    end
end
