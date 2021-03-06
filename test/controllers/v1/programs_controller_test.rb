require 'test_helper'

module Api
  module V1
    class ProgramsControllerTest < ActionDispatch::IntegrationTest
      test "gets programs index" do
        get api_v1_programs_path
        assert_response :success
        assert_equal "index", @controller.action_name
      end

      test "no equipment supplied returns only bodyweight programs" do
        get api_v1_programs_path

        program_ids = JSON.parse(@response.body).map { |program| program['id'] }
        refute programs(:womens_intermediate_soccer).id.in?(program_ids)
        refute programs(:mens_beginner_football).id.in?(program_ids)
        refute programs(:general_hypertrophy).id.in?(program_ids)
        assert programs(:lean_mean_bodyweight).id.in?(program_ids)
      end

      test "programs filtered by available equipment list" do
        band, bench = equipment(:band, :bench)

        get api_v1_programs_path(equipment_ids: [band, bench].map(&:id))

        program_ids = JSON.parse(@response.body).map { |program| program['id'] }

        assert programs(:womens_intermediate_soccer).id.in?(program_ids)
        assert programs(:mens_beginner_football).id.in?(program_ids)
        assert programs(:lean_mean_bodyweight).id.in?(program_ids)
        refute programs(:general_hypertrophy).id.in?(program_ids)
      end

      test "programs filtered by sport, too" do
        soccer, football = sports(:soccer, :football)
        band, bench = equipment(:band, :bench)

        get api_v1_programs_path(sport_id: soccer.id, equipment_ids: [band, bench].map(&:id))

        program_ids = JSON.parse(@response.body).map { |program| program['id'] }

        assert programs(:womens_intermediate_soccer).id.in?(program_ids)
        refute programs(:mens_beginner_football).id.in?(program_ids)
        refute programs(:general_hypertrophy).id.in?(program_ids)
      end

      test "response matches signature in spec" do
        get api_v1_programs_path

        response = JSON.parse(@response.body)

        %w(id name sport required_equipment).each do |key|
          assert response.first.keys.include?(key)
        end
      end
    end
  end
end