class NotificationSerializer < ApplicationSerializer
  attributes :id, 
             :receivable_id,
             :receivable_type,
             :targetable_id,
             :targetable_type,
             :created_at,
             :action,
             :targetable,
             :sendable,
             :location,
             :display_address

  def targetable
    if(targetable_type == 'Post')
      PostSerializer.new(object.post_targetable, root: false)
    end
  end

  def targetable_id
    if(targetable_type == 'Post')
      object.post_targetable.encrypted_id
    else
      object.targetable_id
    end
  end

  # return sendable only if it is a comment action
  # we don't want to expose the location of any user
  def sendable
    if(object.action == 'commented')
      object.sendable
    end
  end

  def location
    if(object.action == 'spread')
      object.user_sendable.location
    end
  end

  def display_address
    if(object.action == 'spread')
      object.user_sendable.location.display_address rescue nil
    end
  end
end