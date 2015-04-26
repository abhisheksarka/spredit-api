require 'json'

namespace :one_time do

  task :update_post_category => :environment do 
    User.all.each do | u |
      c = Configuration::PostCategory.new(values: Post.default_initial_categories.map { | c | c[:value] }.join(','))
      u.post_category_configuration = c
      u.save
    end 
  end
end
