require "application_system_test_case"

class StatisticsTest < ApplicationSystemTestCase
  setup do
    @statistic = statistics(:one)
  end

  test "visiting the index" do
    visit statistics_url
    assert_selector "h1", text: "Statistics"
  end

  test "creating a Statistic" do
    visit statistics_url
    click_on "New Statistic"

    fill_in "Casess", with: @statistic.casess
    fill_in "Created at", with: @statistic.created_at
    fill_in "Deaths", with: @statistic.deaths
    fill_in "State", with: @statistic.state
    fill_in "Uf", with: @statistic.uf
    fill_in "Updated at", with: @statistic.updated_at
    click_on "Create Statistic"

    assert_text "Statistic was successfully created"
    click_on "Back"
  end

  test "updating a Statistic" do
    visit statistics_url
    click_on "Edit", match: :first

    fill_in "Casess", with: @statistic.casess
    fill_in "Created at", with: @statistic.created_at
    fill_in "Deaths", with: @statistic.deaths
    fill_in "State", with: @statistic.state
    fill_in "Uf", with: @statistic.uf
    fill_in "Updated at", with: @statistic.updated_at
    click_on "Update Statistic"

    assert_text "Statistic was successfully updated"
    click_on "Back"
  end

  test "destroying a Statistic" do
    visit statistics_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Statistic was successfully destroyed"
  end
end
