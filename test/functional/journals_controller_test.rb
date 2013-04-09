require 'test_helper'

class JournalsControllerTest < ActionController::TestCase
  setup do
    @journal = journals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:journals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create journal" do
    assert_difference('Journal.count') do
      post :create, journal: { attendees: @journal.attendees, begin_time: @journal.begin_time, body: @journal.body, end_time: @journal.end_time, event_date: @journal.event_date, meeting: @journal.meeting, title: @journal.title }
    end

    assert_redirected_to journal_path(assigns(:journal))
  end

  test "should show journal" do
    get :show, id: @journal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @journal
    assert_response :success
  end

  test "should update journal" do
    put :update, id: @journal, journal: { attendees: @journal.attendees, begin_time: @journal.begin_time, body: @journal.body, end_time: @journal.end_time, event_date: @journal.event_date, meeting: @journal.meeting, title: @journal.title }
    assert_redirected_to journal_path(assigns(:journal))
  end

  test "should destroy journal" do
    assert_difference('Journal.count', -1) do
      delete :destroy, id: @journal
    end

    assert_redirected_to journals_path
  end
end
