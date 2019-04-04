module Types
    class CustomerType < BaseObject
      field :id, ID, null: false
      field :address, AddressType, null: false   # , resolve: -> (obj, args, ctx) {pp "resolve : #{obj.address_id} args : #{args} ctx:#{ctx}"}
      field :admins_id, String, null: false
      field :date_of_creation, String, null: false
      field :business_name, String, null: false
      field :full_name, String, null: false
      field :phone_number, String, null: false
      field :email, String, null: false
      field :technical_ressource_phone_number, String, null: false
      field :technical_ressource_email, String, null: false
      field :created_at, String, null: false
      field :updated_at, String, null: false

    #   def address_id(obj)
    #     # pp context.inspect
    #     # pp self.inspect
    #     # pp 5
    #     return Address.where(id: obj.address_id)
    #   end
    end
end