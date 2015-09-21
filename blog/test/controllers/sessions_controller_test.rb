require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  # test "should get create" do
  #   get :create
  #   assert_response :success
  # end
  
  # 测试能够登录
  test "should login" do
    dave = user(:one)
    post :create, name: dave.name, password: 'secret'
    assert_redirected_to admin_url
    assert_equal dave.id, session[:user_id]
  end
  
  # 测试不能登录
  test "should fail login" do
    dave = user(:one)
    post :create, name: dave.name, password: 'wrong'
    assert_redirected_to login_url
  end

  # test "should get destroy" do
  #   get :destroy
  #   assert_response :success
  # end
  
  # 测试登出
  test "should logout" do
    delete :destroy
    assert_redirected_to login_url
  end

end
