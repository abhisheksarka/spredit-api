class SpreadWithSpreadPublishableSerializer < BaseSerializer
  attributes :id, 
             :action,
             :spreadable_id,
             :spreadable_type,
             :spread_publishable_id,
             :spread_publishable_type
  has_one :spread_publishable
end