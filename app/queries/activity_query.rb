class ActivityQuery
  attr_accessor :activities

  def initialize(activities = Activity.all)
    @activities = activities.extending(Scopes)
  end

  module Scopes
    def belongs_to(sendable)
      eager_load.where(sendable_id: sendable.id, sendable_type: sendable.class.to_s).order(created_at: :desc)
    end

    def eager_load
      # here post_targetable is an association used for eager loading which has been set in initializers/activity
      includes(post_targetable: [:postable, :post_publishable, :views, :spreads, :contains, { propagation: :locations }])
    end

    def notifications(receivable)
      eager_load
      .includes(user_sendable: :location)
      .where(receivable_id: receivable.id, receivable_type: receivable.class.to_s)
      .where('(sendable_id != ? AND sendable_type = ?)', receivable.id, receivable.class.to_s)
      .order(created_at: :desc)
    end

    def with_pagination(page, per_page=15)
      paginate(page: page, per_page: per_page)
    end
  end
end
