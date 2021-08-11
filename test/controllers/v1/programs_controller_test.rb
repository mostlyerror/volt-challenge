require 'test_helper'

module Api
  module V1
    class ProgramsControllerTest < ActionDispatch::IntegrationTest
      test "gets programs index" do
        get api_v1_programs_path
        assert_response :success
        assert_equal "index", @controller.action_name
      end

      test "no query params returns all programs" do
        get api_v1_programs_path
        assert_equal Program.count, JSON.parse(@response.body).size
      end
    end
  end
end