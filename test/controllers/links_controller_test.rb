require "test_helper"

class LinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @no_slug_one    = links(:no_slug_one)
    @with_slug_one  = links(:with_slug_one)
  end

  test "should get index" do
    get links_url
    assert_response :success
  end

  test "should create link" do
    assert_difference("Link.count") do
      post '/links', params: { link: { slug: @no_slug_one.slug, url: @no_slug_one.url } }
    end

    assert_redirected_to links_url
  end

  test "should redirect link" do
    get short_url(slug: @with_slug_one.slug)
    assert_redirected_to @with_slug_one.url
  end
end
