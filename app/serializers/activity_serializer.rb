class ActivitySerializer < BaseSerializer
  attributes :id, 
             :sendable_id,
             :sendable_type,
             :causable_id,
             :causable_type,
             :created_at,
             :action
  has_one :causable
  has_one :target
end