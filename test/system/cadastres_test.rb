require "application_system_test_case"

class CadastresTest < ApplicationSystemTestCase
  setup do
    @cadastre = cadastres(:one)
  end

  test "visiting the index" do
    visit cadastres_url
    assert_selector "h1", text: "Cadastres"
  end

  test "creating a Cadastre" do
    visit cadastres_url
    click_on "New Cadastre"

    fill_in "Cpf", with: @cadastre.cpf
    fill_in "Name", with: @cadastre.name
    fill_in "Phone", with: @cadastre.phone
    click_on "Create Cadastre"

    assert_text "Cadastre was successfully created"
    click_on "Back"
  end

  test "updating a Cadastre" do
    visit cadastres_url
    click_on "Edit", match: :first

    fill_in "Cpf", with: @cadastre.cpf
    fill_in "Name", with: @cadastre.name
    fill_in "Phone", with: @cadastre.phone
    click_on "Update Cadastre"

    assert_text "Cadastre was successfully updated"
    click_on "Back"
  end

  test "destroying a Cadastre" do
    visit cadastres_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cadastre was successfully destroyed"
  end
end
