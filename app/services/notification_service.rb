class NotificationService
  attr_accessor :action,
                :sendable,
                :receivable,
                :causable

  def initialize(action)
    @action = action
  end
  
  def from(sendable)
    @sendable = sendable
    self
  end

  def to(receivable)
    @receivable = receivable
    self
  end

  def for(causable)
    @causable = causable
    self
  end

  def notify
    sendable.sent_notifications.create({
      action: action,
      receivable: receivable,
      causable: causable
    })
  end

end