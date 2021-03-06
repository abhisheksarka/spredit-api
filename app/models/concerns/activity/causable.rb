module Activity::Causable
  extend ActiveSupport::Concern

  included do
    has_many :caused_activities, as: :causable, class_name: 'Activity', foreign_key: :causable_id
    after_create :create_caused_activity
  end

  module ClassMethods
    def activity_sender(&block)
      @activity_sender_block = block
    end

    def activity_receiver(&block)
      @activity_receiver_block = block
    end

    def activity_target(&block)
      @activity_target_block = block
    end

    def activity_action(&block)
      @activity_action_block = block
    end
  end

  private

  def create_caused_activity
    self.caused_activities.create({
      action: Activity.action_types[activity_action_block.call(self).to_sym][:value],
      receivable: activity_receiver_block.call(self),
      targetable: activity_target_block.call(self),
      sendable: activity_sender_block.call(self)
    })
  end

  def activity_receiver_block
    try_proc(self.class.instance_variable_get(:@activity_receiver_block))
  end

  def activity_sender_block
    try_proc(self.class.instance_variable_get(:@activity_sender_block))
  end

  def activity_target_block
    try_proc(self.class.instance_variable_get(:@activity_target_block))
  end

  def activity_action_block
    try_proc(self.class.instance_variable_get(:@activity_action_block))
  end 

  def try_proc(assigned_block)
    assigned_block || Proc.new { }
  end 
end
