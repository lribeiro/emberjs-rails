
require 'test_helper'

class AssetTest < ActionController::IntegrationTest
  
  test "asset pipeline should serve assets" do
    get "/assets/application.js"
    assert_response :success
  end

  test "asset pipeline should serve vendored assets" do
    get "/assets/ember.js"
    assert_response :success
    assert @response.body =~ /Ember\.VERSION\ =\ \'0\.9\.2\'/
  end
  
end
