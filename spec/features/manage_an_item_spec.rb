require 'rails_helper'

feature "Manage items" do
  scenario "View items", js: true do
    User.create(name: "Name", email: "Email")

    visit users_path

    expect(page).to have_content("Name")
    expect(page).to have_content("Email")
  end

  scenario "Add a new item", js: true do
    Group.create(name: 'Group1')

    visit users_path
    click_on "New item"
    fill_in "Name", with: "Test name"
    fill_in "Email", with: "Test email"
    select "Group1", from: "Group"
    click_on "Save"

    expect(page).to have_content("Test name")
  end

  scenario "Edit an item", js: true do
    User.create(name: "Name 1", email: "Email 1")
    visit users_path

    find('.edit').click
    fill_in "Name", with: "Name 2"
    fill_in "Email", with: "Email 2"
    click_on "Save"

    expect(page).to have_content("Name 2")
    expect(page).to_not have_content("Name 1")
  end

  scenario "Delete an item", js: true do
    User.create(name: "Name 1", email: "Email 1")

    visit users_path
    find('.destroy').click
    within('.confirmation_box') { click_on "Yes" }

    expect(page).to_not have_content("Name 1")
  end

  scenario "Use a custom action", js: true do
    User.create(name: "Name 1", email: "Email 1")

    visit users_path
    find('.change_name').click

    expect(page).to_not have_content("Changed Name")
  end

  scenario 'View a belong relation', js: true do
    group = Group.create(name: 'Group', id: 999)
    User.create(name: "Name 1", email: "Email 1", group: group)

    visit users_path

    expect(page).to have_content('Group')
    expect(page).to_not have_content(999)
  end
end
