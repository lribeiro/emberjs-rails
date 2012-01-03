
require 'test_helper'

class AssetTest < ActionController::IntegrationTest
  
  test "asset pipeline should serve assets" do
    get "/assets/application.js"
    assert_response :success
  end

  test "asset pipeline should serve vendored ember.js" do
    get "/assets/ember.js"
    assert_response :success
    assert @response.body =~ /Project:\ \ Ember\ Runtime/
  end

  test "asset pipeline should serve vendored ember-datetime.js" do
    get "/assets/ember-datetime.js"
    assert_response :success
    assert @response.body =~ /Ember\.DATETIME/
  end

  test "asset pipeline should serve vendored ember-data.js" do
    get "/assets/ember-data.js"
    assert_response :success
    assert @response.body =~ /window.DS/
  end

  test "asset pipeline should serve vendored html5.js" do
    get "/assets/html5.js"
    assert_response :success
    assert @response.body =~ /HTML5 Shiv v3/
  end

end
