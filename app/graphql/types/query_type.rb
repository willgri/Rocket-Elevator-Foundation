module Types
  class QueryType < BaseObject

    field :all_interventions, [InterventionType], null: false do
      argument :id, ID, required: false
    end  

    field :all_buildings, [BuildingType], null: true do
      argument :id, ID, required: false
    end



    def all_interventions(id: nil)
      if id
        Intervention.where(id: id)
      else
        Intervention.all
      end
    end

    def all_buildings(id: nil)
      if id
        Building.where(id: id)
      else
        Building.all
      end
    end



  end
end
