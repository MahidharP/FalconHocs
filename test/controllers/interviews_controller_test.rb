require 'test_helper'

class InterviewsControllerTest < ActionController::TestCase
  setup do
    @interview = interviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interview" do
    assert_difference('Interview.count') do
      post :create, interview: { description: @interview.description, interviewer_id: @interview.interviewer_id, remarks: @interview.remarks, slot: @interview.slot, student_id: @interview.student_id, type: @interview.type, user_id: @interview.user_id }
    end

    assert_redirected_to interview_path(assigns(:interview))
  end

  test "should show interview" do
    get :show, id: @interview
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @interview
    assert_response :success
  end

  test "should update interview" do
    patch :update, id: @interview, interview: { description: @interview.description, interviewer_id: @interview.interviewer_id, remarks: @interview.remarks, slot: @interview.slot, student_id: @interview.student_id, type: @interview.type, user_id: @interview.user_id }
    assert_redirected_to interview_path(assigns(:interview))
  end

  test "should destroy interview" do
    assert_difference('Interview.count', -1) do
      delete :destroy, id: @interview
    end

    assert_redirected_to interviews_path
  end
end