require "test_helper"

class AboutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = users(:admin)
    @about = abouts(:one)
    sign_in @admin
  end

  test "should get index" do
    get abouts_url
    assert_response :success
  end

  test "should get new" do
    get new_about_url
    assert_response :success
  end

  test "should create about" do
    assert_difference('About.count') do
      post abouts_url, params: { about: { buttom: @about.buttom, change: @about.change, githubtitle: @about.githubtitle, linkgithub: @about.linkgithub, list1: @about.list1, list2: @about.list2, list3: @about.list3, title: @about.title, toppara: @about.toppara } }
    end

    assert_redirected_to abouts_path
  end

  test "should show about" do
    get abouts_url(@about)
    assert_response :success
  end

  test "should get edit" do
    get edit_about_url(@about)
    assert_response :success
  end

  test "should update about" do
    patch about_url(@about), params: { about: { buttom: @about.buttom, change: @about.change, githubtitle: @about.githubtitle, linkgithub: @about.linkgithub, list1: @about.list1, list2: @about.list2, list3: @about.list3, title: @about.title, toppara: @about.toppara } }
    assert_redirected_to abouts_path
  end

  test "should destroy about" do
    assert_difference('About.count', -1) do
      delete about_url(@about)
    end

    assert_redirected_to abouts_url
  end
end
