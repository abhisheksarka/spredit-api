class ActivitySerializer < ApplicationSerializer
  attributes :id, 
             :sendable_id,
             :sendable_type,
             :targetable_id,
             :targetable_type,
             :created_at,
             :action,
             :targetable

  def targetable
    if(targetable_type == 'Post')
      PostSerializer.new(object.post_targetable, root: false)
    end
  end
end