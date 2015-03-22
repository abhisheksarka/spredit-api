class SpreadSerializer < ApplicationSerializer
  attributes :id, 
             :action,
             :spreadable_id,
             :spreadable_type,
             :spread_publishable_id,
             :spread_publishable_type,
             :errors
end