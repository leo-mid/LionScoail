require "application_system_test_case"

class AboutsTest < ApplicationSystemTestCase
  setup do
    @about = abouts(:one)
  end

  test "visiting the index" do
    visit abouts_url
    assert_selector "h1", text: "Abouts"
  end

  test "creating a About" do
    visit abouts_url
    click_on "New About"

    fill_in "Bottom", with: @about.bottom
    fill_in "Change", with: @about.change
    fill_in "Githubtitle", with: @about.githubtitle
    fill_in "Linkgithub", with: @about.linkgithub
    fill_in "List1", with: @about.list1
    fill_in "List2", with: @about.list2
    fill_in "List3", with: @about.list3
    fill_in "Title", with: @about.title
    fill_in "Toparea", with: @about.toparea
    click_on "Create About"

    assert_text "About was successfully created"
    click_on "Back"
  end

  test "updating a About" do
    visit abouts_url
    click_on "Edit", match: :first

    fill_in "Bottom", with: @about.bottom
    fill_in "Change", with: @about.change
    fill_in "Githubtitle", with: @about.githubtitle
    fill_in "Linkgithub", with: @about.linkgithub
    fill_in "List1", with: @about.list1
    fill_in "List2", with: @about.list2
    fill_in "List3", with: @about.list3
    fill_in "Title", with: @about.title
    fill_in "Toparea", with: @about.toparea
    click_on "Update About"

    assert_text "About was successfully updated"
    click_on "Back"
  end

  test "destroying a About" do
    visit abouts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "About was successfully destroyed"
  end
end
