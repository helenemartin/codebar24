require 'test_helper'

class IntertitlesControllerTest < ActionController::TestCase
  setup do
    @intertitle = intertitles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:intertitles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create intertitle" do
    assert_difference('Intertitle.count') do
      post :create, intertitle: { content: @intertitle.content, title: @intertitle.title }
    end

    assert_redirected_to intertitle_path(assigns(:intertitle))
  end

  test "should show intertitle" do
    get :show, id: @intertitle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @intertitle
    assert_response :success
  end

  test "should update intertitle" do
    patch :update, id: @intertitle, intertitle: { content: @intertitle.content, title: @intertitle.title }
    assert_redirected_to intertitle_path(assigns(:intertitle))
  end

  test "should destroy intertitle" do
    assert_difference('Intertitle.count', -1) do
      delete :destroy, id: @intertitle
    end

    assert_redirected_to intertitles_path
  end
end
