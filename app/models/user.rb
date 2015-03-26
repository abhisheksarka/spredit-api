class User < ActiveRecord::Base
  include FbAuthable
  include JwtAuthable
  include Locatable
  include LocationConfigurable

  include PostPublishable
  include SpreadPublishable
  include CommentPublishable
  include ViewPublishable

  include Activity::Receivable
  include Activity::Sendable
  acts_as_voter
end
