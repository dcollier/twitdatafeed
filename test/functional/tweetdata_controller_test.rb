require 'test_helper'

class TweetdataControllerTest < ActionController::TestCase
  setup do
    @tweetdatum = tweetdata(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tweetdata)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tweetdatum" do
    assert_difference('Tweetdatum.count') do
      post :create, :tweetdatum => { :author => @tweetdatum.author, :content => @tweetdatum.content, :time => @tweetdatum.time }
    end

    assert_redirected_to tweetdatum_path(assigns(:tweetdatum))
  end

  test "should show tweetdatum" do
    get :show, :id => @tweetdatum
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tweetdatum
    assert_response :success
  end

  test "should update tweetdatum" do
    put :update, :id => @tweetdatum, :tweetdatum => { :author => @tweetdatum.author, :content => @tweetdatum.content, :time => @tweetdatum.time }
    assert_redirected_to tweetdatum_path(assigns(:tweetdatum))
  end

  test "should destroy tweetdatum" do
    assert_difference('Tweetdatum.count', -1) do
      delete :destroy, :id => @tweetdatum
    end

    assert_redirected_to tweetdata_path
  end
end
