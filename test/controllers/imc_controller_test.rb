require "test_helper"

class ImcControllerTest < ActionDispatch::IntegrationTest
  test "should get calcular" do
    get imc_calcular_url
    assert_response :success
  end
end
