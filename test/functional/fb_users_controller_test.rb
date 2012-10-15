require 'test_helper'

class FbUsersControllerTest < ActionController::TestCase
  setup do
    @fb_user = fb_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fb_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fb_user" do
    assert_difference('FbUser.count') do
      post :create, fb_user: { email: @fb_user.email, fbid: @fb_user.fbid, name: @fb_user.name, phone: @fb_user.phone }
    end

    assert_redirected_to fb_user_path(assigns(:fb_user))
  end

  test "should show fb_user" do
    get :show, id: @fb_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fb_user
    assert_response :success
  end

  test "should update fb_user" do
    put :update, id: @fb_user, fb_user: { email: @fb_user.email, fbid: @fb_user.fbid, name: @fb_user.name, phone: @fb_user.phone }
    assert_redirected_to fb_user_path(assigns(:fb_user))
  end

  test "should destroy fb_user" do
    assert_difference('FbUser.count', -1) do
      delete :destroy, id: @fb_user
    end

    assert_redirected_to fb_users_path
  end
end
