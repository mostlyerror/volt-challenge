module Api
  module V1
    class ProgramsController < ApplicationController
      def index
        if params['sport_id']
          programs = Program.includes(:equipments).where(sport_id: params['sport_id'].to_i)
        else
          programs = Program.includes(:equipments).all
        end

        equipment_ids = params['equipment_ids'] || []
        equipment_ids.map!(&:to_i)

        matches = programs.select do |program|
          required_equipment_ids = program.equipments.pluck(:id)
          required_equipment_ids & equipment_ids == required_equipment_ids
        end

        render json: ActiveModel::Serializer::CollectionSerializer.new(matches,
          each_serializer: ProgramSerializer)
      end
    end
  end
end