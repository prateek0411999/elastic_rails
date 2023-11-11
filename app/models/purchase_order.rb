class PurchaseOrder < ApplicationRecord
    has_many :order_items, dependent: :destroy

    #including elastic search model will get us exact replica of purchase_order table in elastic search db
    #callbacks -> works on any action on object, will also update the ES db
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    #after including this we'll be able to use its build in methods when 
    #quering out the data
    #something like -> (PurchaseOrder.search query { match: {id: 1410 }}).results.first

    settings index:  {number_of_shards: 1 } do 
        mapping dynamic: 'false' do
            indexes :id, type: :integer
            indexes :purchase_date, type: :date, format: :date_optional_time
            indexes :status, type: :keyword
            indexes :payment_method, type: :keyword
        end 
    end


end
