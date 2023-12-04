require "application_system_test_case"

class MecanicosTest < ApplicationSystemTestCase
  setup do
    @mecanico = mecanicos(:one)
  end

  test "visiting the index" do
    visit mecanicos_url
    assert_selector "h1", text: "Mecanicos"
  end

  test "should create mecanico" do
    visit mecanicos_url
    click_on "New mecanico"

    fill_in "Codigo", with: @mecanico.codigo
    fill_in "Endereco", with: @mecanico.endereco
    fill_in "Especialidade", with: @mecanico.especialidade
    fill_in "Nome", with: @mecanico.nome
    click_on "Create Mecanico"

    assert_text "Mecanico was successfully created"
    click_on "Back"
  end

  test "should update Mecanico" do
    visit mecanico_url(@mecanico)
    click_on "Edit this mecanico", match: :first

    fill_in "Codigo", with: @mecanico.codigo
    fill_in "Endereco", with: @mecanico.endereco
    fill_in "Especialidade", with: @mecanico.especialidade
    fill_in "Nome", with: @mecanico.nome
    click_on "Update Mecanico"

    assert_text "Mecanico was successfully updated"
    click_on "Back"
  end

  test "should destroy Mecanico" do
    visit mecanico_url(@mecanico)
    click_on "Destroy this mecanico", match: :first

    assert_text "Mecanico was successfully destroyed"
  end
end
