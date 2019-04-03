module Types
  class QueryType < BaseObject

    field :all_interventions, [InterventionType], null: false do
      argument :id, ID, required: false
      # argument :building_id, ID, required: false
    end  
    # argument :url, String, required: true


    def all_interventions(id: nil)
      if id
        Intervention.where(id: id)
      else
        Intervention.all
      end
    end

  end
end

# module Types
#   class QueryType < BaseObject
#     # queries are just represented as fields
#     # `all_links` is automatically camelcased to `allLinks`
#     field :all_links, [LinkType], null: false

#     # this method is invoked, when `all_link` fields is beeing resolved
#     def all_links
#       Link.all
#     end
#   end
# end
