require 'test_helper'

class CadastresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cadastre = cadastres(:one)
  end

  test "should get index" do
    get cadastres_url
    assert_response :success
  end

  test "should get new" do
    get new_cadastre_url
    assert_response :success
  end

  test "should create cadastre" do
    assert_difference('Cadastre.count') do
      post cadastres_url, params: { cadastre: { cpf: @cadastre.cpf, name: @cadastre.name, phone: @cadastre.phone } }
    end

    assert_redirected_to cadastre_url(Cadastre.last)
  end

  test "should show cadastre" do
    get cadastre_url(@cadastre)
    assert_response :success
  end

  test "should get edit" do
    get edit_cadastre_url(@cadastre)
    assert_response :success
  end

  test "should update cadastre" do
    patch cadastre_url(@cadastre), params: { cadastre: { cpf: @cadastre.cpf, name: @cadastre.name, phone: @cadastre.phone } }
    assert_redirected_to cadastre_url(@cadastre)
  end

  test "should destroy cadastre" do
    assert_difference('Cadastre.count', -1) do
      delete cadastre_url(@cadastre)
    end

    assert_redirected_to cadastres_url
  end
end
