module Api
  module V1
    class ProgramsController < ApplicationController
      def index
        if params['equipment_ids']&.present?
          equipment_ids = params['equipment_ids']

          program_ids = EquipmentProgram
            .select(:program_id)
            .where(equipment_id: equipment_ids)
            .group(:program_id)
            .having("COUNT(*) >= ?", equipment_ids.size)
            .pluck(:program_id)
          
          programs = Program.where(id: program_ids)
        else
          programs = Program.all
        end

        if params['sport_id']&.present?
          sport = Sport.find(params['sport_id'])
          programs = programs.where(sport: sport)
        end

        render json:ActiveModel::Serializer::CollectionSerializer.new(programs, each_serializer: ProgramSerializer)
      end
    end
  end
end