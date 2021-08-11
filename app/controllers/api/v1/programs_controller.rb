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
          
          programs = Program.find program_ids
        else
          programs = Program.all
        end

        render json: programs
      end
    end
  end
end