class User < ActiveRecord::Base
  include FbAuthable
  include JwtAuthable
  include Locatable
  include LocationConfigurable

  include PostPublishable
  include SpreadPublishable
  include CommentPublishable
  include ViewPublishable

  include Notification::Receivable
  include Notification::Sendable
end
