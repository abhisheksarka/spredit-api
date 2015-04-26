class PostValidator < ActiveModel::Validator
  def validate(record)
    if title_and_content_absent?(record) and record.postable.blank?
      record.errors[:post_invalid] << I18n.t("api_response.code_1400") 
    end
  end

  private

  def title_and_content_absent?(r)
    r.title.blank? and r.content.blank?
  end
end
