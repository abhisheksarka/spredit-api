module PostCategoryConfigurable
  extend ActiveSupport::Concern

  included do
    has_one :post_category_configuration, as: :configurable_post_category, class_name: 'Configuration::PostCategory'
    before_create :lc_set_default_post_category_values
  end

  def lc_set_default_post_category_values
    self.post_category_configuration = Configuration::PostCategory.new(
      values: Post.default_initial_categories.map { | c | c[:value] }.join(',')
    )
  end
end
