class PurchaseOrder < ApplicationRecord
    has_many :order_items, dependent: :destroy

    #including elastic search model will get us exact replica of purchase_order table in elastic search db
    #callbacks -> works on any action on object, will also update the ES db
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    #after including this we'll be able to use its build in methods when 
    #quering out the data
    #something like -> (PurchaseOrder.search query { match: {id: 1410 }}).results.first

end
