require 'test_helper'

class <%= plural_model.capitalize %>ControllerTest < ActionController::TestCase
  setup do
    @<%= model_name %> =<%= plural_model %>(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:<%= plural_model %>)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create <%= model_name %>" do
    assert_difference('<%= model_name.capitalize %>.count') do
      post :create, :<%= model_name %> => @<%= model_name %>.attributes
    end

    assert_redirected_to <%= model_name %>_path(assigns(:<%= model_name %>))
  end

  test "should show <%= model_name %>" do
    get :show, :id => @<%= model_name %>.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @<%= model_name %>.to_param
    assert_response :success
  end

  test "should update <%= model_name %>" do
    put :update, :id => @<%= model_name %>.to_param, :<%= model_name %> => @<%= model_name %>.attributes
    assert_redirected_to <%= model_name %>_path(assigns(:<%= model_name %>))
  end

  test "should destroy <%= model_name %>" do
    assert_difference('<%= model_name.capitalize %>.count', -1) do
      delete :destroy, :id => @<%= model_name %>.to_param
    end

    assert_redirected_to <%= plural_model %>_path
  end
end
