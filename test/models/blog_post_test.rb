require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "draft? should return true for draft post" do
    # the blog_posts method is given us by the blog post fixture
    assert blog_posts(:draft).draft?
  end

  test "draft? should return false for published post" do
     refute blog_posts(:published).draft?
  end

  test "draft? should return false for scheduled post" do
    refute blog_posts(:scheduled).draft?
  end

  test "published? should return true for published post" do
    assert blog_posts(:published).published?
  end

  test "published? should return false for draft post" do
    refute blog_posts(:draft).published?
  end

  test "published? should return false for scheduled post" do
    refute blog_posts(:scheduled).published?
  end

  test "scheduled? should return true for scheduled post" do
   assert blog_posts(:scheduled).scheduled?
  end

  test "scheduled? should return false for draft post" do
    refute blog_posts(:draft).scheduled?
  end

  test "scheduled? should return false for published post" do
    refute blog_posts(:published).scheduled?
  end
end
