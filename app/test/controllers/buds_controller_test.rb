require 'test_helper'

class BudsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bud = buds(:one)
  end

  test "should get index" do
    get buds_url
    assert_response :success
  end

  test "should get new" do
    get new_bud_url
    assert_response :success
  end

  test "should create bud" do
    assert_difference('Bud.count') do
      post buds_url, params: { bud: { identifier: @bud.identifier, session_id: @bud.session_id } }
    end

    assert_redirected_to bud_url(Bud.last)
  end

  test "should show bud" do
    get bud_url(@bud)
    assert_response :success
  end

  test "should get edit" do
    get edit_bud_url(@bud)
    assert_response :success
  end

  test "should update bud" do
    patch bud_url(@bud), params: { bud: { identifier: @bud.identifier, session_id: @bud.session_id } }
    assert_redirected_to bud_url(@bud)
  end

  test "should destroy bud" do
    assert_difference('Bud.count', -1) do
      delete bud_url(@bud)
    end

    assert_redirected_to buds_url
  end
end
